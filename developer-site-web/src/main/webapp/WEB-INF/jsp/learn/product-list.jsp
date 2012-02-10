<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="static com.bring.developer.config.ApplicationConfig.FRAKTGUIDE_URL_FOR_ENVIRONMENT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<c:set var="today" value="${todayString}"/>


<html>

<head>
    <misc:contenttype />
    <misc:title value="Product list" />
    <misc:css />
</head>

<body class="page-productlist">
    <div class="wrapper">
        <misc:header />
        
        <div class="main">
            <menutabs:showMenu cssClass="menutab" />
            <div class="content group">
                <div class="article">
                    <h1>Product list</h1>
                    <p class="ingress">The Shipping Guide offers a broad range of products by Bring. We will gradually increase the number of products and functionality available in the service.</p>
                    <p>The table below shows currently available products and which information that is available. The links are to examples using XML API.</p>
                    
					<table class="productlist">
						<thead>
						<tr>
							<th>Product</th>
							<th>Product code</th>
							<th>Price</th>
							<th>Expected Delivery</th>
						</tr>
						</thead>
						<tbody>
                    	<c:forEach items="${productList.products}" var="product" >
							<tr>
								<td><c:out value="${product.name}" /><c:if test="${product.note > 0}"> <sup><c:out value="${product.note}"/></sup></c:if></td>
								<td><a target="_blank" href="<%= FRAKTGUIDE_URL_FOR_ENVIRONMENT %><c:out value="${fn:replace(product.codeLink, '***DATESTRING***', today)}" />"><code><c:out value="${product.code}" /></code></a></td>
								<td><a target="_blank" href="<%= FRAKTGUIDE_URL_FOR_ENVIRONMENT %><c:out value="${fn:replace(product.priceLink, '***DATESTRING***', today)}" />"><c:out value="${product.price ? 'Yes' : 'No'}" /></a></td>
								<td><a target="_blank" href="<%= FRAKTGUIDE_URL_FOR_ENVIRONMENT %><c:out value="${fn:replace(product.expectedDeliveryLink, '***DATESTRING***', today)}" />"><c:out value="${product.expectedDelivery ? 'Yes' : 'No'}" /></a></td>
							</tr>
                    	</c:forEach>
						</tbody>
					</table>
                    <c:forEach items="${productList.note}" var="note" >
                    <br/><sup><c:out value="${note.id}" /> <c:out value="${note.content}" /></sup>
                    </c:forEach>

                    <br/><br/>
                    <h3>Additional Services</h3>
                    <p>The Shipping Guide offers some functionality regarding additional services. Please use the provided codes below when accessing the service. The links are to examples using XML API.</p>

					<table class="productlist">
						<thead>
						<tr>
							<th>Additional Service Code</th>
							<th>Applies to</th>
							<th>Name</th>
						</tr>
						</thead>
						<tbody>
                    	<c:forEach items="${productList.additionalService}" var="service" >
							<tr>
                                <td><a target="_blank" href="<%= FRAKTGUIDE_URL_FOR_ENVIRONMENT %><c:out value="${fn:replace(service.codeLink, '***DATESTRING***', today)}" />"><c:out value="${service.code}" /></a></td>
                                <td><c:out value="${service.appliesTo}" escapeXml="false" /></td>
                                <td><c:out value="${service.name}" /></td>
							</tr>
                    	</c:forEach>
						</tbody>
					</table>

                    <misc:license />
                </div>
                <div class="span-2 last">
                    <misc:getsatisfaction/>
					<misc:comments />
				</div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>