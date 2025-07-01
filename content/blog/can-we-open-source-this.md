---
layout: post
title: Can we open source this?
publishDate: 2017-05-23 12:00:00 +01:00
tags:
  - open-source
params:
  authors:
    - ElisabethIrgens
---

Can a design system for the Norwegian postal service be open source? Can the GitHub repo be public? YES! We think that would be awesome.

But we work in a large organisation… And while rogue dev teams may be happy to open source — it’s understandable if other departments around us are not equally familiar with the idea. So we wrote up the benefits, showed that we have considered risks and concerns — and found cool examples of other companies doing the same as we want to do.

***

## Benefits ✨

Working in the open has some really cool benefits:

### Community involvement
We depend on the community for code, knowledge, inspiration and tutorials every single day in the work that we do. Giving back to this community by sharing our work should very much be in the spirit of our company, too.

### Transparency is cool
There are no secrets in a design system, and everything is there in the browser on the sites using it. We can’t see a reason to develop it behind closed doors.

### Awesome for recruiting
We do a lot of fun work in our team, and it’s super positive to be able to show some of it off and talk about more of it. Having a public repo is like a bat-signal for developers: come join us.

### Fun and useful for contributors
There’s a personal benefit for contributors who can show off their work, and even ask peers for help.

### Higher standard
Knowing that anyone and everyone can see your work, will hold us to a higher standard. If it helps us write better code and more useful commit messages, this is excellent.

***

## Risks and concerns ✅

There are a couple of things we need to be aware of:

### Security
Developers pushing to a public repo need to be conscious of this. Our mindset should be that the moment we push a commit, that code is public knowledge. It’s important to make sure that certain details are never part of the repo: passwords, server names, deploy scripts and so on.

* We can write guidelines around this.
* We can have an onboarding for new contributors.
* We can consider Git Hooks as a preventive measure.
* We can consider having a private repo with a public mirror. But this is perhaps more relevant for applications with a higher risk profile, in case of accidentally pushing code that shouldn’t be pushed.

### Privacy
Developers working with the design system could feel they are being imposed with a transparency they don’t want. The people involved right now are excited about a public repo, but it’s possible to imagine someone else later feeling different about this.

* If someone joining the project wants anonymity, they could use whatever GitHub account they want. It doesn’t have to contain their real name, or be the same one they’ve used before.

### Licensing
Code in a public repo needs a license. We need to make sure that there are no conflicts between the license we choose, and the licenses of other parts of code we use.

* Which license should our code have?
* Which licenses are there on other code that we use?
* Are there any conflicts between these licenses?
* We can consider hosting fonts, icons and assets in a different repo.

### Credits
Hat tips are polite anyway, but especially important in a public repo.

* We can maintain a `credits.md` to say thank you for any code, tools and ideas we use.

### Worth the extra effort?
There is potentially “more work” being created than when developing behind closed doors. It holds us to a higher standard  on everything from hacks, commit messages and discussions in issues.

* We can change our mind. If it turns out the benefits do not outweigh the extra effort, we can revert to private.

***

## Do any other companies do this? 🤔

They sure do. Here are some examples of companies with design systems, UI&nbsp;frameworks or pattern libraries in public repos:

* [github.com/audi/audi-ui](https://github.com/audi/audi-ui)
* [github.com/buzzfeed/solid](https://github.com/buzzfeed/solid)
* [github.com/cloudflare/cf-ui](https://github.com/cloudflare/cf-ui)
* [github.com/Financial-Times/ft-origami](https://github.com/Financial-Times/ft-origami)
* [github.com/twbs/bootstrap](https://github.com/twbs/bootstrap)
* [github.com/salesforce-ux/design-system](https://github.com/salesforce-ux/design-system)
* [github.com/18F/web-design-standards](https://github.com/18F/web-design-standards)

Our favourite example is Salesforce and their [Lightning Design System](https://www.lightningdesignsystem.com/). It’s&nbsp;useful to point to their repo and show that absolutely anyone with access to the internet can see both code and commits. And if this is okay for a company like Salesforce — we can do it too.

***

So where is the design system…? We’re ironing out final details, but [stay tuned](https://twitter.com/bringdeveloper) and we’ll get there soon.
