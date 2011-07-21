<h1>Bring open source Java client library</h1>

<h2>Introduction</h2>

<p>The client Library provides services from shipping guide and tracking.<br/>
It is possible to look up the price, delivery times and product information on one or more packages,<br/>
in addition to track packages.<br/>
The library supports httpClient version 3 and 4</p>

<h2>Requirements</h2>

<p>Java 1.6, or newer<br />
Joda-Time</p>

<h2>Installation</h2>

<p>Download jar-file (include as library in your project), or add Maven dependency (TODO: add maven dependency xml).</p>

<h2>Usage</h2>

<p>1. Initialize library (new BringService("url to your web site"))<br />
2. Prepare query<br />
 - Use ShipmentDescription and PackageDescription to describe shipment guide queries<br />
 - Use TrackingQuery to describe tracking queries<br />
3. Fetch information using the BringService class</p>

<h2>Examples</h2>

<h3>Fetch price information from Bring shipment guide:</h3>

<p> // Initialize library<br />
 String clientId = "www.mywebshop.com";<br />
 BringService bringService = new BringService(clientId);</p>

<p> // Prepare query<br />
 Package packet = new Package();<br />
 packet.setWeightInGrams("4233");<br />
 Shipment shipment = new Shipment();<br />
 shipment.withFromPostalCode("1409");<br />
 shipment.withToPostalCode("7050");<br />
 shipment.addPackage(packet);<br />
 shipment.addProduct(Product.SERVICEPAKKE);</p>

<p> // Fetch price information from Bring<br />
 ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.PRICE);<br />
 String amountWithVAT = shippingGuideResult<br />
 .getProduct(Product.SERVICEPAKKE)<br />
 .getPrice()<br />
 .getPackagePriceWithoutAdditionalServices()<br />
 .getAmountWithVAT();</p>

<p> // Display result<br />
 System.out.println("Price: "+amountWithVAT);</p>

<h3>Fetch tracking information from Bring Tracking:</h3>

<p> // Initialize library<br />
 String clientId = "www.mywebshop.com";<br />
 BringService bringService = new BringService(clientId);</p>

<p> //Prepare query<br />
 TrackingQuery query = new TrackingQuery();<br />
 query.setQueryNumber("1234567");</p>

<p> //Fetch Tracking information from Bring<br />
 TrackingResult trackingResult = bringService.queryTracking(query);<br />
 String totalWeight = trackingResult.getConsignment(0)<br />
 .getTotalWeight()<br />
 .getValue();</p>

<p> //Display result<br />
System.out.println("Total weight:" + totalWeight);</p>