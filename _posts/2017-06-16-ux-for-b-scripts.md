---
layout: post
title: UX for b-scripts
date: 2017-06-16 09:00:00 00:00
category: monitoring scripts
author:
    - AnshikaKoul
    - kaaveland
---

There is a lot of potential value in automation and providing software developers with scripts that can perform common tasks for them. To get good adoption and awareness of such a suite of scripts, it is very important to provide a nice user experience. As in typical frontend UX, there's a lot to be said for making things consistent. Little things like using flags in a manner that is consistent with other command line interfaces are actually quite important. For example, `-f` should usually mean the same thing as `--force` and `-v` the same thing as `--version` or `--verbose`. Consistency within a suite of scripts is also important, because it empowers the user -- by learning how a feature works in one script, they can transfer that knowledge and reuse it in a different context or script.

Color is another element that matters a lot in command line interfaces. In general, we try to make error conditions stand out in a red color, and we use yellow for important informational notices. We use green to notice about things that the user ought to be happy about. It's important to not overuse colors, but a little bit really helps a lot in identifying the lines that you should be looking at when there is a lot of output.

<img src="{{ site.baseurl }}/img/script_output.png" />

Within our `b-scripts` suite, we try to make every script respect `-h` to mean the same thing as `--help`. We also encourage everyone to provide tab-completion for their scripts (typically this is the most difficult thing to get right).
