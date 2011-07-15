<%@ tag language="java" pageEncoding="UTF-8"%>

                <div class="article">
              
                      
<h1>How to use the data?</h1>

<p>Create your own services with data from Bring! Choose how you want to retrieve data from the Shipping Guide.</p>

<h2>XML API</h2>
<p>
	XML API is the easiest way to integrate the Shipping Guide to an online store. The method provides access to data from Bring via a single interface.</p>
<p>
	Example of how to retrieve XML from the Shipping Guide:
</p>
<p>
    <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/all.xml?from=1407&amp;to=1476&amp;weightInGrams=4000">Servicepakke of 4 kg from Levanger to Rasta</a>
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/xmlOverHttp.do">More examples!</a>
</p>

<h2>JSON</h2>
<p>
   	Web browsers can retrieve information from external sites if the data are made available in JSONP format.
	The purpose is that you can paste HTML / Javascript on your web page and easily use data from the Shipping guide without server components on your web page.
</p>
<p> 
	JSON has the same functionality as the XML API and can deliver data in JSON or JSONP format.
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/jsonp.do">Try the JSON service!</a>
</p>

<h2>Online data (Web Services)</h2>
<p>
	With Online Web Services, you can look up price, transportation, area coverage and product information for each product as required.
	For advanced users we recommend the Web Services with several options in the query.
</p>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/fraktguideGui.do">Try the service!</a>
</p>

<h2> Offline data (download and Web Services) </h2>
<p>
     This is pre-prepared data for offline use.
     Enter the zip code you are sending from and which products you want data for. For each product you get:
</p>
<ul>
    <li>Prissone og transporttid i virkedager for hvert postnummer</li>
    <li>Priser for hver prissone</li>
</ul>
<p>
    <a href="http://fraktguide.bring.no/fraktguide/offlineData.do">Try the service!</a>
</p>
<p>
    <strong>NB!</strong> With offline data, you have to deal with all the rules as special goods
	     <a target="_blank" href="http://www.bring.no/324.cms"> estimated shipping weight (volume weight) </a>, and more.
	     Remember to update the data at pricechanges!
</p>



                    </div>