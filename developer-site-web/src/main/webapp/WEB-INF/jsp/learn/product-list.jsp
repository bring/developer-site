<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
								<td><c:out value="${product.name}" /></td>
								<td><code><c:out value="${product.code}" /></code></td>
								<td><c:out value="${product.price ? 'Yes' : 'No'}" /></td>
								<td><c:out value="${product.expectedDelivery ? 'Yes' : 'No'}" /></td>
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