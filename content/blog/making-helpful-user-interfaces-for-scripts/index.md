---
layout: post
title: Making helpful user interfaces for scripts
publishDate: 2017-06-23 09:00:00 +00:00
tags:
  - monitoring scripts
params:
  authors:
    - AnshikaKoul
    - kaaveland
---

There is a lot of value in automation and providing software developers with scripts that can perform common tasks. To get good adoption and awareness of a suite of scripts, it is very important to provide a nice user experience.

Just like in frontend, there's a lot to be said for making things consistent. Little things, like using flags in a manner that is consistent with other command line interfaces matter quite a lot. For example, `-v` should usually mean the same thing as `--verbose`. Consistency within a suite of scripts is also important, because it empowers the user -- by learning how a feature works in one script, they can transfer that knowledge and reuse it in a different context or script.

For the same reason, it is important to use the same ordering for positional parameters for scripts that use the same parameters.

Color is another element that matters a lot in command line interfaces. In general, we try to make error conditions stand out in a red color, and we use yellow for important informational notices. We use green to notice about things that the user ought to be happy about.

It's important to not overuse colors, but a little bit really helps a lot in identifying the lines of output that the user should care about. To work well together with other command line tools, the script should detect whether it's part of a pipeline and disable colors if it is.

![](script_output.png)

Within our `b-scripts` suite, we try to make every script respect `-h` to mean the same thing as `--help`.

<pre>
Deploy application to target environment

positional arguments:
  {qa,test,production,dev}
                        environment to deploy to.
  artifact              Artifact to deploy from nexus. Format
                        group_id:artifact_id:[version]

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         See more output
  -f, --force           Skip self-test and auto-update, allow deploys with
                        failing healthchecks
  --skip-self-test      Skip self-test and auto-update
  --skip-demo-post      Do not prompt for demo-on-demand posting
  -l, --latest-release  Deploy the latest release of the project
  -r RELEASE_VERSION, --release-version RELEASE_VERSION
                        Deploy a specific release version of the project
</pre>

We also try to not supply *too* many options and flags as that makes it more difficult to use a script correctly. We think it's better to make the script smart, than to rely on a human to spend extra time understanding how to use it. It's also good to do proper verification of input. Additional safeguard-features like verifying that what the user tries to do is safe, exiting with sensible error messages on failures, and running self-tests of scripts are practices that we really like.

Our scripts also look for updates when they run, so that once a bug has been fixed, every developer automatically gets that fix the next time they try to use the scripts. On the flip side, it's really annoying to break the auto-update logic, since nobody ever pulls manually anymore.

We also encourage everyone to provide tab-completion for their scripts, which typically is the most difficult thing to get right. When you type `b ` and press tab, the `b` executable will invoke `b completions` to find all the available commands it can run. If a command has been completed, it will be invoked with a `--complete` command that will trigger auto-complete logic inside the sub-command. To see how to do that, you can check out [sub](https://github.com/basecamp/sub).

It can be relatively hairy to debug incorrect completions and it happens on occasion that a script will fail with some sort of stacktrace when things go wrong, which makes terminals go completely haywire. On average, it works really well -- it'll reduce the amount of information that a user has to remember in order to use a script correctly. Very often, typing the name of a script and pressing tab will give you a good indication of what you're capable of doing with that command. You can always fall back to the help-text if that's not enough.

To summarize, these are some things we do to try to make friendly scripts:

- We always provide some help-text
- We sparingly use colors for our output
- We make scripts that can automatically fetch updates
- We try to not add too many flags and options
- We perform safety-checks and validations to help the user avoid problems
- When we do provide flags and options, we try to use them consistently
- We are consistent with the order of positional arguments across scripts
- For bonus points, we try to provide good auto-completions
