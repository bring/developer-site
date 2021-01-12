## This is a WIP readme for the upcoming Hugo version
Don’t work on API-files inside the hugo folder. They are temporary and for testing purposes. They will be overwritten when it’s time to switch over.
The build and deploy scripts do not include/work for Hugo yet.

# developer.bring.com

Our developer site uses Node, [Hugo](https://gohugo.io/) and
[RAML 1.0](https://raml.org/). Hugo is a static site generator, and RAML
is a a YAML-based modeling language for APIs.

There is currently no CSS processing in place. We are just using a copy of the old CSS. This will change.

## Adding a new API
Make a new folder in `content/api`, the folder name will be the url slug.
Use RAML 1.0 for you documentation file
Make a index.html file containing the following frontmatter
```
---
title: {Name of API}
layout: api
---
```

Open config.toml and add the new raml path to the `apis` array

## Adding a new article/blog post
If you only have text, make a new .md file in `content/blog`
Use the article title or something close to it as filename, make sure to use dashes instead of spaces. This will be the url slug.

If you have images or other files, make a new folder in `content/blog`
Use the article title or something close to it as foldername, make sure to use dashes instead of spaces. This will be the url slug.
Make an index.md file.
Add your other files to the folder, you can make subfolders if it helps you organise the content.

### Frontmatter and content
Add the following frontmatter to your article file.
```
---
title: {Article title}
layout: post
publishDate: YYYY-MM-DD HH:MM:SS +01:00
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

### Excerpt/summary/read more
The excerpts on the list page is auto generated form the first 60 words in your article. It’s possible to add a manual cutoff and an image.

Add `<!--more-->` where you want the cutoff to happen.

If you want an image in your excerpt, add the following to the frontmatter:
```
resources:
  - src: {filename.jpg}
```

## Updating, building and running
Run `npm run build` to build. This generates a JSON based on the raml files, which Hugo then reads and outputs static HTML from. The other files are also built.

Run `npm start` to run locally. The non-api pages will update instantly. But when you make changes to the api files, you have to build again to generate a new JSON file.
We are working on a more streamlined way of doing this.

### Release and deploy

Deploy to test or QA using b deploy {test|qa}

Merging a PR to master will automatically build and deploy to test, QA and production.
