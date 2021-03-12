# developer.bring.com

## Issues

If you have issues or questions regarding the API, please post in the respective
API’s comments and help section. The issue tracker is for the site itself, as
reflected in the template.

## Tech

The Bring Developer site uses [Hugo](https://gohugo.io/) and
[RAML 1.0](https://raml.org/). Hugo is the world’s fastest static site
generator, and RAML is a a YAML-based modeling language for APIs. We use CSS
with some light post processing.

## Revamped dev site 2021

The site is being improved throughout 2021, the first step was to get rid of
Ruby and Jekyll in favour of Hugo, Node and Webpack. We currently operate with
generated parts of the old CSS mixed with some new, temporary, code.

## Adding a new API

Make a new folder in `content/api`, the folder name will be the url slug. Use
RAML 1.0 for you documentation file. Make a index.html file containing the
following frontmatter:

```
---
title: {Name of API, similar to the name in the raml file}
layout: api
menu:
  apidocs:
    identifier: {foldername}
    title: {Name of API}
    url: /api/{foldername}
    parent: {parent, see config.toml}
weight: {menu position prefixed by parent}
disqus_identifier: api-{foldername} (optional, if you want comments)
---

If you have an alert, it can be added below the frontmatter, here, instead of inside the raml file.
```

Open config.toml and add the new raml file path to the `apis` array.

## Adding a new article/blog post

If you only have text, make a new .md file in `content/blog` Use the article
title or something close to it as filename, make sure to use dashes instead of
spaces. This will be the url slug.

If you have images or other files, make a new folder in `content/blog` Use the
article title or something close to it as foldername, make sure to use dashes
instead of spaces. This will be the url slug. Make an index.md file. Add your
other files to the folder, you can make subfolders if it helps you organise the
content.

### Frontmatter and content

Add the following frontmatter to your article file. It supports multi authors
and multi tags.

```
---
title: {Article title}
layout: post
publishDate: {YYYY-MM-DD HH:MM:SS} +01:00
authors:
  - {githubname}
  - …
tags:
  - {tag}
  - …
---
```

Then add your content below that. Files are linked relative to your .md file

### Excerpt and image

The excerpts on the list page is auto generated form the first 60 words in your
article. It’s possible to manually set the cutoff and add an image.

Add `<!--more-->` where you want the cutoff to happen.

To add an image in your excerpt, add the file to your post’s folder and the
following to the frontmatter:

```
resources:
  - src: {filename.jpg}
```

## Working with guides

There are some frontmatter options intended for, but not exclusive to, the guide
pages. The main reason is to feature a service table at the top. A typical
example:

```
---
title: Pakke i postkassen
titlesub: Mailbox parcel
layout: api
widelayout: true
notanapi: true
menu:
  api:
    parent: guide-checkout
    identifier: guide-mailbox
    title: Pakke i postkassen
weight: 1
services:
  - 3584
  - 3570
examples:
  - <a href="#">Get delivery options with prices and lead time)</a>
  - <a href="#">Book Pakke i postkassen</a>
---
```

`titlesub` is intended for dual language use

`widelayout` is intended for two column layouts

`services` takes an array of api id codes and populates a table with the
associated services and VAS-es. The services are sourced from
data/service.json, which in turn has an array of associated VAS-codes that the
template sources from data/vas.json

`examples` is an array of links to examples in the relevant API documentation –
this solution is intended to be improved into fetching the actual examples.

## Syntax highlighting

To get syntax highlighting in Markdown, you can specify the programming language
of the code example after the opening fence.

````
```html
<form>
  <fieldset>
    <legend>Recipient</legend>
    …
  </fieldset>
</form>
```
````

## Building, running and updating

`npm install` installs the needed dependencies.

`npm run build` builds CSS and JSON based in the raml files. Hugo needs this in
order to run.

Run `npm start` to run locally. The non-api pages will update instantly. But
when you make changes to the api files or CSS, you have to run `npm run build`
again to generate new files for that. We are working on a more automated
solution for this.

`npm run buildtest` builds the entire site for test env `npm run buildqa` builds
the entire site for qa env `npm run buildprod` builds the entire site for
production env

## Deploy and release

Deploy to test or QA using b deploy {test|qa}

Merging a PR to master generates a production build and automatically deploys it
to test, QA and production.
