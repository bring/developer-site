# developer.bring.com

## Tech

The Bring Developer site uses [Hugo](https://gohugo.io/) and
[RAML 1.0](https://raml.org/). Hugo is the world’s fastest static site
generator, and RAML is a a YAML-based modeling language for APIs. We use CSS
with some light post processing and JS that is bundled using Webpack.

## Build, run and deploy

`npm install` installs the dependencies.

`npm run build` builds CSS, JS and JSON. Hugo needs this in order to run.

`npm start` runs Hugo locally. Pages update instantly on change. With two
exceptions:

1. If you are working on the RAML files, you have to run `npm run buildraml` to
   generate new JSON files with the changes.
2. If you are working on the JS or CSS, run `npm run bundlewatch` to have
   Webpack update the bundled files on change.

Hugo watches for changes to those generated files, no need to stop and restart
under normal circumstances.

### Deploy

This application is deployed as an Azure static web app.

When you create a PR, a comment is made with a URL to a custom staging site
where you can test what the final deployed site will be like. When you merge the
PR to master, it will also be deployed to production.

To work locally you can either build the site and open it in a browser, or you
can use Azure’s
[tooling](https://docs.microsoft.com/en-us/azure/static-web-apps/local-development)

## Revamped dev site 2021/2022

Structure, content and features are being worked on iteratively throughout 2021
and 2022.

## Publish an item in API updates

Revision history and Changelog has been renamed to _API updates_ to better
reflect that it covers past, current and upcoming changes.

New items are added with publish date as the file name `yyyy-mm-dd.md` in the
`conten/api/revision-history` folder with the following frontmatter:

```
---
title: {Should at least contain the name of the API}
publishDate: yyyy-mm-dd
layout: api
---
```

If the publish date is set in the future, either the branch must be merged or a
build must be triggered at or after that point in time. In most cases, publish
date is the same as change date, but if the message is about an upcoming change,
the change date should be mentioned in the body text.

## Adding an important message to the frontpage

Important messages are added as list items in the frontmatter of the frontpage
\_index.html file. It supports HTML tags. You are encouraged to link to the
relevant API where more information can be found and not put the entire message
on the frontpage. There is support for multiple messages:

```
important:
  - Important changes to <a href="api/tracking">Tracking API</a> from 01.01.2021
    and 01.03.2021 regarding specified delivery date.
  - <strong class="mrs">Final deadline for authenticating Pickup Point API requests - February 15.
    2021<strong> We have now started to <a href="api/pickup-point">limit the data</a> in the responses
    for unauthenticated requests
```

Also keep in mind that the four latest items in the API updates are featured on
the frontpage.

## Adding a new API

Make a new folder in `content/api`, the folder name will be the url slug. Use
RAML 1.0 for you documentation file. Make a index.md file with YAML frontmatter
at the top. Place the api introduction and other text documentation in the YAML
frontmatter.

### Frontmatter example

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

# Add alerts or important messages and they appear to the side or above of the main content
important:
  - type: {info, warn or error}
    title: {Title of message, optional}
    message: |
      {Content as markdown}

# Add intro, information and documentation to appear before the endpoint listing
introduction: |
  {Optimally one paragraph about the API and what it does, so the user can figure out if it’s the right one to cover their needs}

information:
  - title: {Authentication, formats, rate limiting and other information that is somewhat similar across the various APIs}
    content |
      {Content as markdown}

documentation:
  - title: {Title of section}
    content: |
      {Content as markdown}
---
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
associated services and VAS-es. The services are sourced from data/service.json,
which in turn has an array of associated VAS-codes that the template sources
from data/vas.json. The services appear in the same order as the array.

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

## Issues

If you have issues or questions regarding the API, please post in the respective
API’s comments and support section. The issue tracker is for the site itself, as
reflected in the template.
