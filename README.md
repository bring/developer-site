# developer.bring.com

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
is a good example. We have since changed the config to JSON, but the process is
the same.

## Tech

The Bring Developer site uses [Hugo](https://gohugo.io/),
[OAS](https://www.openapis.org/) and [RAML 1.0](https://raml.org/). Hugo is the
world’s fastest static site generator. For the API endpoint documentation,
generated OAS JSON is replacing manually written RAML. We use CSS with some
light post processing and JS that is bundled with Vite.

## Writing documentation for people

Keep in mind that users are more likely to be looking for use cases than
parameters and values. In a parameter-heavy table, it might make sense to list
the values and explain them like a dictionary. But on higher levels, such as in
endpoint lists and how-to guides, it’s often better to lead with the use case
and then provide the parameter.

## Build, run and deploy

`npm install` installs the dependencies.

`npm run build` builds CSS, JS and JSON. Hugo needs this in order to run.

`npm start` runs Hugo locally. Pages update instantly on change, with one
exception: if you are working on the RAML files, you have to run
`npm run buildraml` to recompile a JSON file with the changes.

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
past, current and upcoming changes. Users can subscribe to either all updates,
or do a selection based on the different API areas.
New messages are automatically emailed to users who subscribe.

New messages are added with publish date as the file name `yyyy-mm-dd.md` in the
different folders under `content/api/revision-history`, reflecting the different
API areas.

- If the message is intended to give an update about one or several APIs, the
message is added in each folder (API area) of the affected API.

- If the message is general and should reach all subscribers, this is added in
the main folder - `content/api/revision-history`.

- Messages that are important can appear on the API page by setting the parameter
`isImportant: true` and including the full API name in the message title.
This can be useful when a message should stay visible for an upcoming or breaking
API change for instance. By changing the publish date and rewriting the message,
or adding another update message when the API change occurs, a new email will be
sent to the subscribers.
Even though the important messages are separated out and presented on their own,
they are still part of the normal RSS feed, that is used for distributing API
updates to subscribers.

The messages are added with the following frontmatter:

```
---
title: {API name}
publishDate: yyyy-mm-dd
layout: api
isImportant: true (boolean) - optional
---
```

In most cases, publish date is the same as the date of the change, but if the
message is about an upcoming change, the change date should be mentioned in the
body text.

Consult the [formula and guide](https://www.mybring.com/design-system/guidelines/writing-information/) to writing these messages. You will also get a comment on your PR with the same link when there are additions in the revision-history folder.

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
    parent: {parent, see config.json}
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

## Adding subpages to an API

If the API documentation has many special topics and much text content before
the endpoint listing, it can be a good idea to split the topics into subpages.
This can be enabled by renaming the `index` file to `_index`. Listing on the
main page and navigation is solved automatially by adding the following to the
frontmatter of the index page:

```
subpages:
  title: Special topics {this will be the title in the main api page and in the sidemenu}
```

And to the subpages’ frontmatter:

```
---
title: {title that appears at the top of the page}
layout: api-sub
menu:
  apidocs:
    identifier: {unique id, for instance apifolder+pagename}
    title: {title that appears in the sidemenu, usually the same as the page title}
    parent: {parent’s identifier value, usually the api folder name}
weight: {menu position within the subpage structure}
---
```

There is support for two levels. If you have many subpages, try grouping them.
This is done by adding a folder for a group, adding a `_index` file with the
frontmatter as described above and putting all the related files into that folder.
In the frontmatter, the parent of the second level should be set to the the id of the
`_index` file.

## Updating Booking & SG and VAS tables

1. Clone and make changes in
   [Mybring Service Country VAS Common](https://github.com/bring/mybring-service-country-vas-common/).
   That is the source; if you make changes directly in the corresponding
   dev-site JSON or XLSX files, they will be overwritten and reverted next time.
2. Generate new files from the main function in
   [ServiceVasMappingJsonGenerator.kt](https://github.com/bring/mybring-service-country-vas-common/blob/master/src/jvmMain/kotlin/com/mybring/devsite/ServiceVasMappingJsonGenerator.kt)
3. Verify the changes in the JSON files in the dev-site’s `data` folder
4. Open the generated xlsx file, replace the relevant sheet in
   `static/services/services_booking_shippingguide.xlsx` in the dev-site repo.

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
