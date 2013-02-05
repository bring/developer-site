<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="show_callback_param" required="true" type="java.lang.Boolean" %>

<table>
  <thead>
  <tr>
    <th>Parameter</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>pnr</td>
    <td>The postal code to look up</td>
  </tr>
  <tr>
    <td>country</td>
    <td>
      The <a href="http://www.iso.org/iso/country_names_and_code_elements">ISO 3166-1-alpha-2 country code</a> to use for the postal code.
    </td>
  </tr>
  <c:if test="${show_callback_param}">
    <tr>
      <td>callback</td>
      <td>
        Optional, for JSONP; The name of the callback method to put in the response.
      </td>
    </tr>
  </c:if>
  </tbody>
</table>
