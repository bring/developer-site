<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--This tag is responsible for displaying the correct sidebar menu, depending on the value of the "from" request parameter. --%>

<c:choose>
  <c:when test="${param.from eq 'booking'}">
    <sidebar:booking-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'postal'}">
    <sidebar:postalcode-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'report'}">
    <sidebar:reports-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'shipping'}">
    <sidebar:shipping-guide-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'support'}">
    <sidebar:support-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'tracking'}">
    <sidebar:tracking-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'purchaseorder'}">
    <sidebar:purchaseorder-sidebar/>
  </c:when>
  <c:when test="${param.from eq 'pickup'}">
    <sidebar:pickuppoint-sidebar/>
  </c:when>
</c:choose>
