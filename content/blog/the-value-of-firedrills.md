---
layout: post
title: The value of firedrills
publishDate: 2017-01-27 13:51:43 +01:00
tags: 
    - postgres
authors:
    - AnshikaKoul
    - kaaveland
---

<img class="mbm" alt="" src="https://appel.nasa.gov/wp-content/uploads/2012/05/HMA-4-1024x768.jpg">

In January 2016, we set up a postgres cluster at bring. While doing the initial configuration, we designed what we thought was a pretty decent backup architecture and we set up streaming replication to a hot standby. While configuring the cluster, we made sure to verify our ability to recover from backup, as well as our ability to fail over from the master server to the standby server. This gives us redundancy in case of outages or patching, and it gives us recoverability in case of data corruption, or so we thought. We documented the procedures and all was well. At this point our postgres installation was on 9.4, and we upgraded that to 9.5 to get some new features before we really started using it.

We ran a firedrill in November where we performed a failover in our QA environment. That failover exercise was not a success, because streaming replication had stopped two weeks prior, and we hadn't picked that up. Cue introducing better monitoring. We set the standby up from scratch again. In January 2017, we scheduled another few fire drills and in the first one, we encountered some difficulties that we learned a lot from. We spent the better part of two work days figuring out these problems, what follows is a short summary of what happened and what we learned.

Our postgres master is set up to archive its write-ahead log (WAL) to a location that is shared with the standby and the standby receives streaming replication from the master [in a typical setup](https://www.postgresql.org/docs/9.5/static/high-availability.html).

On performing the failover, we first stopped the postgres master server, ran `service postgresql promote` on the standby server and updated a DNS record. So far, so good -- there was 45 seconds or so of downtime, as seen from the applications and everything came back up fine. Then we started working on setting up the former master as a standby server, so we'd be back to where we started and this is where we started running into trouble.

When we wrote the failover documentation, it seemed that in order to use a former master as a standby, you had to run a [`pg_rewind`](https://www.postgresql.org/docs/9.5/static/app-pgrewind.html).

Our first sign that something was wrong was the unexpected output `no rewind required`, which we later learned is actually a good thing. Our instructions said that we'd find a `recovery.done` file in the postgres data directory, which we also didn't find. Our failover documentation had expected `pg_rewind` to copy this file for us. At this point, we became aware of the botched failover attempt from November, and went off trying to investigate whether it had created some weird state in the cluster. We discovered that we had 5 timelines on our master server and had no idea what that meant. We created a [recovery.conf](https://www.postgresql.org/docs/9.5/static/recovery-config.html) manually, and attempted to start the former master as a standby. That failed, with errors in the log that the server was unable to retrieve timeline 4. After a while, we discovered this file (`00000004.history`) in our WAL archive and moved it to the new master. This time, the standby did indeed read timeline 4, and also timeline 5, and started trying to read WAL.

This failed repeatedly because it was attempting to retrieve a WAL segment that the master had already archived - `000000050000009A00000059`. We attempted to copy this segment from the WAL archive to the master, but that didn't help. At this point, we started wondering why the standby wasn't simply executing its [`restore_command`](https://www.postgresql.org/docs/9.5/static/warm-standby.html#STANDBY-SERVER-SETUP) -- after all, the segment was present in the archive.

We noticed that the standby logged that it started streaming from timeline 3, while the master logged that it was writing to timeline 5. We added some logging to our `restore_command` and discovered that the standby was actually trying to retrieve `000000030000009A00000059` (notice that 3), and not `000000050000009A00000059`. These have the same WAL segment numbers, but are on different timelines. At this point we discovered a file named `000000030000009A00000059.partial` in our WAL archive and started worrying about data corruption. As a last-ditch attempt for the day, we removed the `.partial` suffix from the file, the standby recovered it but still couldn't start streaming replication again.

After hours, we read a bit about postgres and timelines and in the morning we tried to set up the standby by adding `recovery_target_timeline='latest'` to our `recovery.conf`. At this point, the standby was able to retrieve `000000050000009A00000059`, but no other WAL files from yesterday were still available, our backup job had made a new [`pg_basebackup`](https://www.postgresql.org/docs/9.5/static/app-pgbasebackup.html) and cleaned out the old WAL.

We decided to set up a completely fresh standby from our backup and got our second nasty surprise in 2 days, when it turned out that we were missing the very first WAL segment after the `pg_basebackup` because of a bug in our backup-script. At this point, we set up a fresh standby from the current running master with `pg_basebackup` and slept very poorly.

We now know for sure that our problem with setting up the former master as a standby was due to not knowing about timelines. What we needed to know:

- When a standby is promoted to master, it creates a new timeline
- It will archive the last WAL segment of the old timeline with a `.partial` suffix
- The `.partial` segment file is harmless and you're not expected to need it
- A postgres instance that starts up with a `recovery.conf`, will by default attempt to stream to the timeline it was on when it was shut down
- Using `recovery_target_timeline` lets you control this behaviour
- Using `pg_rewind` is not necessary when the former master shuts down gracefully
- In effect, what `pg_rewind` does is to discard transactions on the old master, which the new master does not know about

In our case, we were on timeline 3 when we started. Because of the botched exercise in November, we also had a timeline 4, but it wasn't in use anywhere. So when we promoted the standby, we created timeline 5 which started at the same WAL segment number as timeline 3 ended on.

You can learn even more about timelines, WAL and postgres standby setup in the talk [Warm standby done right](https://www.youtube.com/watch?v=mlQ90MntJwM&list=PLWW0CjV-TafZo4lBWuzw7OYJY7Y4SW76B&index=17) and the talk [pg_rewind - resynchronizing servers after failover](https://www.youtube.com/watch?v=J4KzjHTx2WE) by Heikki Linakangas, the author of `pg_rewind` (note: these are kind of scary).

After the firedrill, we made sure to keep WAL segments around for 7 days. We obviously documented `recovery_target_timeline`. We also set up testing of our backups, so that their viability for backup recovery can be automatically tested every day. We ran a few firedrills after this one, and those have worked out fine and we're now pretty sure that we have a much better understanding of how WAL works.

We're super happy that we did this firedrill. Not only do we now know a whole lot more about how postgres works, but we also feel pretty confident that we have a working backup and can sleep much better at night. Firedrills in general are awesome, and this one in particular helped us close a lot of really bad problems in our database setup.
