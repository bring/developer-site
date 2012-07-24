<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars"%>

<%--This tag is responsible for displaying the correct sidebar menu, depending on the value of the
"from" request parameter. --%>
<%
    String from = request.getParameter("from");
    if(from == null){
        /*If there is no parameter named "from" in the request, no sidebar will be displayed*/
        return;
    }

    if      (from.startsWith("booking")) {%><sidebar:booking-sidebar /><%}
    else if (from.startsWith("postal"))  {%><sidebar:postalcode-sidebar /><%}
    else if (from.startsWith("report"))  {%><sidebar:reports-sidebar /><%}
    else if (from.startsWith("shipping")){%><sidebar:shipping-guide-sidebar /><%}
    else if (from.startsWith("support")) {%><sidebar:support-sidebar /><%}
    else if (from.startsWith("tracking")){%><sidebar:tracking-sidebar /><%}
    else if (from.startsWith("pickup"))  {%><sidebar:pickuppoint-sidebar /><%}
    else { return; }



%>
