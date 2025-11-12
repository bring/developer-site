# developer.bring.com

## Tech

The Bring Developer site uses [Hugo](https://gohugo.io/) as a static site
generator, [OAS](https://www.openapis.org/) JSON or YAML for the API endpoint
documentation, CSS with some light post processing and JS that is bundled with
Vite.

## Writing documentation for people

Users can be looking for guides, use cases and specific parameters. In a
parameter-heavy table, it might make sense to list the values and explain them
like a dictionary. But on higher levels, such as in endpoint lists and how-to
guides, it’s often better to lead with the use case and then provide the
parameter. The design system has a couple of
[resouces on how to write for users](https://www.mybring.com/design-system/guidelines/writing/).

## Build, run and deploy

`npm i` installs the dependencies.

`npm run build` builds CSS, JS and JSON. Hugo needs this in order to run.

`npm start` runs Hugo locally. Pages update instantly on change, with one
exception: if you are working on the RAML files, you have to run
`npm run buildraml` to recompile a JSON file with the changes.

Hugo watches for changes to those generated files, no need to stop and restart
under normal circumstances.

### Deploy

This application is deployed as an Azure static web app.

When you create a PR, a comment is made with a URL to a custom staging site
where you can test what the final deployed site will be like. We have a limit of
10 staging areas, so if your build fails, it might because there are lots of PRs
already – which is rarely the case. When you merge the PR to master, it will
also be deployed to production.

### Without commit or PR

Updates to external data sources, such as the OAS API JSON files, means there is
nothing to commit and no PR. You can manually trigger a new build and deploy by
running the workflow in
[Actions](https://github.com/bring/developer-site/actions/workflows/azure-static-web-apps-mango-cliff-0e97d9203.yml)
or via your terminal
`gh workflow run azure-static-web-apps-mango-cliff-0e97d9203.yml`.

## Publish an API update message

Revision history and Changelog is called _API updates_ to reflect that it covers
past, current and upcoming changes. Users can subscribe to emails with either
all updates or a selection based on the different API areas. New messages are
automatically emailed to subscribers on Monday mornings, if there has been no
update since last time, no emails will be sent.

- Add new messages with publish date as file name `yyyy-mm-dd.md` in the
  respective existing API area folders under `content/api/revision-history`.
  Don’t make folders for individual APIs, but use the specific API name in the
  title.

- If the message is general and should reach all subscribers and be published on
  all API pages, put it in the main folder - `content/api/revision-history`.

- If you want to send a message more than once, for instance repeating a
  previously announced change closer to the actual date, update the publish date
  and rewrite the message to match the grammatical tense.

- Consult the
  [formula and guide](https://www.mybring.com/design-system/guidelines/writing-information/)
  to writing these messages. You will also get a comment on your PR with the
  same link when there are additions in the revision-history folder.

### Visibility logic

Max 3 messages will be shown on the various API pages, the rest will be put in a
disclosure. There is also a time limit:

- Regular messages older than 2 months will be put in the disclosure.
- Messages with the `isImportant: true` parameter will be put in the disclosure
  after a year. This means they can be shown again when a newer regular message
  has been put in the disclosure.

### Frontmatter

```
---
title: {API name}
publishDate: yyyy-mm-dd
layout: api
params:
  isImportant: true (boolean) - optional
---
```

In most cases, publish date is the same as the date of the change, but if the
message is about an upcoming change, the change date should be mentioned in the
body text.

## Adding a new API

Make a new folder in `content/api`, the folder name will be the url slug. Make
an index.md file with YAML frontmatter at the top (see example). Place the api
introduction and other text documentation you might have in the frontmatter
under the `params` key along with the link to the Open API SPecification (OAS 3)
JSON in an `oas` key.

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
    parent: {parent, see hugo.json}
weight: {menu position prefixed by parent value}
params:
  disqus_identifier: api-{foldername} (optional, if you want comments)
  oas: {Link to OAS JSON, typically outputted by Swagger}

  # Add alerts above the updates content
  alerts:
    - title: {Title of message, optional}
      content: |
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
---
```

## Adding subpages to an API

If the API documentation has many special topics and much text content before
the endpoint listing, it can be a good idea to split the topics into subpages.
This can be enabled by renaming the `index` file to `_index`. Listing on the
main page and navigation is solved automatially by adding the following to the
frontmatter of the index page:

```
params:
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
frontmatter as described above and putting all the related files into that
folder. In the frontmatter, the parent of the second level should be set to the
the id of the `_index` file.

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
layout: api
menu:
  api:
    parent: guide-checkout
    identifier: guide-mailbox
    title: Pakke i postkassen
weight: 1
params:
  titlesub: Mailbox parcel
  widelayout: true
  notanapi: true
  services:
    - 3584
    - 3570
  examples:
    - <a href="#">Get delivery options with prices and lead time</a>
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

If you are a Bring developer and need help, we have a dedicated
<a href="https://posten.slack.com/archives/C6ST0MNQ7">Slack channel</a>
