# Setup

The developer site relies on rake for building and deployment. For an overview of the available commands, run
<pre>
  rake -T
</pre>

#Start the server locally for development
first build the project with maven
<pre>
  mvn clean install
</pre>
start the server (from top directory)
<pre>
  rake dev:server
</pre>  
server should be started on localhost listening on port 8082

## Hosts

It is recommended that you use an alias for your local machine.

To do this, add the following line to your hosts file (/etc/hosts on mac, c:\\windows\\system32\\drivers\\etc\\hosts on windows):
<pre>
127.0.0.1       local.bring.no
127.0.0.1       api.local.bring.com
</pre>

## Architecture

The architecture of this site is very simple and cosists of jsp-files and a few tags. The jsp-files are located in 
<pre>/developer-site-web/src/main/webapp/WEB-INF/jsp</pre>
and the the tags are in
<pre>/developer-site-web/src/main/webapp/WEB-INF/tags</pre>

Hopefully the only confusing thing about this site is the way we have divided the contents of the API pages into tabs (such as XML, JSON and SOAP):
<pre>
&lt;div data-tab="xml"&gt;
 This content will only be visible when xml is selected in the menu
&lt;/div&gt;

&lt;p&gt;
 This will always be visible
&lt;/p&gt;

&lt;div data-tab="xml json"&gt;
 This will be visible when either of xml or json is selected.
&lt;/div&gt;

&lt;div data-tab="soap"&gt;
 This will only be visible if SOAP is selected in the menu
&lt;/div&gt;
</pre>
