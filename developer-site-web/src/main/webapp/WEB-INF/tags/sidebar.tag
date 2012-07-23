<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars"%>


<%--    If the user is comming from the Shipping Guide API, display the shipping guide menu --%>
<%
    String from = request.getParameter("from");

    if(from == null){
        return;
    }

    if(from.startsWith("booking")) {%><sidebar:booking-sidebar /><%}
    else if(from.startsWith("postalcode")) {%><sidebar:postalcode-sidebar /><%}
    else if(from.startsWith("reports")) {%><sidebar:reports-sidebar /><%}
    else if(from.startsWith("shipping")) {%><sidebar:shipping-guide-sidebar /><%}
    else if(from.startsWith("support")) {%><sidebar:support-sidebar /><%}
    else if(from.startsWith("tracking")) {%><sidebar:tracking-sidebar /><%}
    else if(from.startsWith("pickuppoint")) {%><sidebar:pickuppoint-sidebar /><%}
    else{
    return;
}

%>





