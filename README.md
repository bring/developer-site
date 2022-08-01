# developer.bring.com

Structure, content and features are being worked on iteratively throughout 2021
and 2022.

If you want to work on your new OAS documentation while keeping the current one
running, do the following:

- Rename and commit the API’s `index.md` file to `_index.md`, this allows for
  subpages and it keeps the file history intact.
- Duplicate the file and name it `new.md`
- Remove `disqus`, `menu` and `weight` objects. This will prevent conflicts with
  the currently published page.
- Add `hidden: true` instead. This will hide the new page in the menu and from
  search engines.
- Commit and make PR – the new page will be available at `{current-url}/new`

If you don’t need duplication, just add `oas: {url to json}` to the current
`index.md` file

Remember to clean up your old docs, the
[PR for Modify Delivery API](https://github.com/bring/developer-site/pull/1184/files)
is a good example.

## Tech

The Bring Developer site uses [Hugo](https://gohugo.io/),
[OAS](https://www.openapis.org/) and [RAML 1.0](https://raml.org/). Hugo is the
world’s fastest static site generator. For the API endpoint documentation,
generated OAS JSON is replacing manually written RAML. We use CSS with some
light post processing and JS that is bundled with Webpack.

## Writing documentation for people

Keep in mind that users are more likely to be looking for use cases than
parameters and values. In a parameter-heavy table, it might make sense to list
the values and explain them like a dictionary. But on higher levels, such as in
endpoint lists and how-to guides, it’s often better to lead with the use case
and then provide the parameter.

## Build, run and deploy

`npm install` installs the dependencies.

`npm run build` builds CSS, JS and JSON. Hugo needs this in order to run.

`npm start` runs Hugo locally. Pages update instantly on change. With two
exceptions:

1. If you are working on the RAML files, you have to run `npm run buildraml` to
   recompile a JSON file with the changes.
2. If you are working on the JS or CSS, run `npm run bundlewatch` to have
   Webpack update the bundled files on change.

Hugo watches for changes to those generated files, no need to stop and restart
under normal circumstances.

### Deploy

This application is deployed as an Azure static web app.

When you create a PR, a comment is made with a URL to a custom staging site
where you can test what the final deployed site will be like. When you merge the
PR to master, it will also be deployed to production.

### Without commit or PR

Updates to external data sources, such as the OAS API JSON files, means there is
nothing to commit and no PR. You can manually trigger a new build and deploy by
running the workflow in
[Actions](https://github.com/bring/developer-site/actions/workflows/azure-static-web-apps-mango-cliff-0e97d9203.yml)
or via your terminal
`gh workflow run azure-static-web-apps-mango-cliff-0e97d9203.yml`.

## Publish an API update message

Revision history and Changelog is called _API updates_ to reflect that it covers
past, current and upcoming changes. New messages are automatically emailed to
users who subscribe.

New messages are added with publish date as the file name `yyyy-mm-dd.md` in the
`conten/api/revision-history` folder with the following frontmatter:

```
---
title: {API name}
publishDate: yyyy-mm-dd
layout: api
---
```

In most cases, publish date is the same as the date of the change, but if the
message is about an upcoming change, the change date should be mentioned in the
body text.

### Tips for writing an API update message

- Get the names right. ("Pickup Point API", not "PickuppointAPI". "Mybring" not
  "MyBring".)
- Use complete service names ("Pakke i Postkassen" instead of "PiP").
- Avoid using internal names, too technical jargon and uncommon abbreviations
  ("XML" is ok, "PuP" is not).
- Domain specific content like service code lists and code examples are fine.
- Be clear about which users/customers are affected.
- Describe what action users must take (if any).
- Put yourself in the shoes of the user; is there anything that they might
  misunderstand, have questions about or otherwise start worrying about?
- Check typos and facts.
- Try keeping it short.

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

New APIs should use the Open API Specification (OAS 3).

Make a new folder in `content/api`, the folder name will be the url slug. Make
an index.md file with YAML frontmatter at the top (see example). Place the api
introduction and other text documentation you might have in the frontmatter
along with the link to the OAS JSON in an `oas` key.

### YAML frontmatter example

```
---
title: {Name of API}
layout: api
menu:
  apidocs:
    identifier: {foldername}
    title: {Name of API}
    url: /api/{foldername}
    parent: {parent, see config.toml}
weight: {menu position prefixed by parent value}
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

# Additional documentation. Organise it into technical info and how-to info. The former works as a continuation of the previous section. The latter as guides for the user leading into the endpoint section.
documentation:
  - title: {Title of section}
    content: |
      {Content as markdown}

# OAS file link with endpoints, examples etc.
oas: {Link to OAS JSON, typically outputted by Swagger}
---
```

## Service portfolio data sources

The Service portfolio is made with files generated by
[Mybring Service Country VAS Common](https://github.com/bring/mybring-service-country-vas-common/).
To update information in the tables (except Reports and Invoice):

1. Clone and make the necessary changes in said repo
2. Generate new files from the main function in
   [ServiceVasMappingJsonGenerator.kt](https://github.com/bring/mybring-service-country-vas-common/blob/master/src/jvmMain/kotlin/com/mybring/devsite/ServiceVasMappingJsonGenerator.kt)
3. Verify the changes in the JSON files in this repo’s `data` folder
4. Open the generated xlsx file, replace the relevant sheet in the
   `static/services/service_portfolio.xlsx` file in this repo.

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
