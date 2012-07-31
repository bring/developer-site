# Setup

The developer site relies on rake for building and deployment. For an overview of the available commands, run
<pre>
$ rake -T
</pre>


## Hosts

It is recommended that you use an alias for your local machine.

To do this, add the following line to your hosts file (/etc/hosts on mac, c:\\windows\\system32\\drivers\\etc\\hosts on windows):
<pre>
127.0.0.1       local.bring.no
</pre>

## Architecture

The architecture of this site is very simple and cosists of jsp-files and a few tags. The jsp-files are located in 
<pre>/developer-site-web/src/main/webapp/WEB-INF/jsp</pre>
and the the tags are in
<pre>/developer-site-web/src/main/webapp/WEB-INF/tags</pre>.

Hopefully the only confusing thing about this site is the way we have divided the contents of the API pages into tabs (such as XML, JSON and SOAP):
<pre>
<div data-tab="xml">
 This content will only be visible when xml is selected in the menu
</div>

<p>
 This will always be visible
</p>

<div data-tab="xml json">
 This will be visible when either of xml or json is selected.
</div>

<div data-tab="soap">
 This will only be visible if SOAP is selected in the menu
</div>
</pre>
