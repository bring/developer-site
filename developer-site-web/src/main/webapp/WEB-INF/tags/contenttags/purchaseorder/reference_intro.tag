<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="suffix" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<pre class="code-box">Request prefix:
https://api.bring.com/po/api/v1/</pre>

  <table>
    <thead>
    <tr>
      <th>Field</th>
      <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><code>/purchaseorderCustomer/&lt;customernumber&gt;</code></td>
      <td>Returns true if given customer is an valid Bring PurchaseOrder customer.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring customer number
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>/order/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns complete purchase order information including order items.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring PurchaseOrder customer number
          </li>
          <li>
            <code>&lt;purchaseordernumber&gt;</code> = valid purchase order number
          </li>
        </ul>
      </td>
    </tr>
    <tr >
      <td><code>/items/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns purchase order items.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring PurchaseOrder customer number
          </li>
          <li>
            <code>&lt;purchaseordernumber&gt;</code> = valid purchase order number
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>/transport/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns transportorders if any on given purchaseorder.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring PurchaseOrder customer number
          </li>
          <li>
            <code>&lt;purchaseordernumber&gt;</code> = valid purchase order number
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>/senderStatus/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns Open or Locked status on given purchase order.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring PurchaseOrder customer number
          </li>
          <li>
            <code>&lt;purchaseordernumber&gt;</code> = valid purchase order number
          </li>
        </ul>
      </td>
    </tr>
    </tbody>
  </table>
