## This is a WIP readme for the upcoming Hugo version
Don’t work on API-files inside the hugo folder. They are temporary and for testing purposes. They will be overwritten when it’s time to switch over.
The build and deploy scripts do not include/work for Hugo yet.

# developer.bring.com

Our developer site uses Node, [Hugo](https://gohugo.io/) and
[RAML 1.0](https://raml.org/). Hugo is a static site generator, and RAML
is a a YAML-based modeling language for APIs.

We use CSS with some light post processing.

We use Disqus for comments. Disabled by default, it can be activated in the api section using "comments: true".

## Adding a new API
Make a new folder in `content/api`, the folder name will be the url slug.
Use RAML 1.0 for you documentation file.
Make a index.html file containing the following frontmatter:
```
---
title: {Name of API, similar to the name in the raml file}
layout: api
menu:
  apidocs:
    identifier: "{foldername}"
    title: "{Name of API}"
    url: "/api/{foldername}"
weight: {menu position}
disqus_identifier: api-{foldername} (optional, if you want comments)
---

If you have an alert, it can be added below the frontmatter, here, instead of inside the raml file.
```

Open config.toml and add the new raml file path to the `apis` array

## Adding a new article/blog post
If you only have text, make a new .md file in `content/blog`
Use the article title or something close to it as filename, make sure to use dashes instead of spaces. This will be the url slug.

If you have images or other files, make a new folder in `content/blog`
Use the article title or something close to it as foldername, make sure to use dashes instead of spaces. This will be the url slug.
Make an index.md file.
Add your other files to the folder, you can make subfolders if it helps you organise the content.

### Frontmatter and content
Add the following frontmatter to your article file. It supports multi authors and multi tags.
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

Then add your content below that.
Files are linked relative to your .md file

### Excerpt/summary/read more/image
The excerpts on the list page is auto generated form the first 60 words in your article. It’s possible to manually set the cutoff and add an image.

Add `<!--more-->` where you want the cutoff to happen.

To add an image in your excerpt, add the following to the frontmatter:
```
resources:
  - src: {filename.jpg}
```

## Updating, building and running
`npm run build` builds CSS and JSON based in the raml files. Hugo needs this in order to run locally.

Run `npm start` to run locally. The non-api pages will update instantly. But when you make changes to the api files or CSS, you have to run `npm run build`again to generate new files for that.
We are working on a more automated solution for doing this.

`npm run buildtest` builds the entire site for test env
`npm run buildqa` builds the entire site for qa env
`npm run buildprod` builds the entire site for production env

### Release and deploy

Deploy to test or QA using b deploy {test|qa}

Merging a PR to master will automatically build and deploy to test, QA and production.
