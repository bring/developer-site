<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="suffix" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<pre class="code-box">Request prefix:
https://api.bring.com/po/api/v1/</pre>

  <table>
    <thead>
    <tr>
      <th>Path</th>
      <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><code>GET /purchaseorderCustomer/&lt;customernumber&gt;</code></td>
      <td>Returns true if given customer is an valid Bring PurchaseOrder customer.
        <ul>
          <li>
            <code>&lt;customernumber&gt;</code> = valid Bring customer number
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>GET /order/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
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
    <tr>
        <td><code>POST /order/</code></td>
        <td>todo...</td>
    </tr>
    <tr >
      <td><code>GET /items/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
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
      <td><code>GET /transport/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
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
        <td><code>POST /transport/</code></td>
        <td>Add packaginglist with the given details.

            Example request:
            <CreateTransportOrderRequest xmlns="http://api.bring.com/po">
                <RequestProperties>
                    <SchemaVersion>1</SchemaVersion>
                    <Locale>en</Locale>
                    <DateAndTimes subClass="RequestDate">2014-07-01T10:00:26.686+02:00</DateAndTimes>
                </RequestProperties>
                <CustomerNo>1234</CustomerNo>
                <PurchaseOrderNo>12345</PurchaseOrderNo>
                <TransportOrder>
                    <ConsignmentId>123456</ConsignmentId>
                    <PackingListSet orderLineId="1"></PackingListSet>
                </TransportOrder>
            </CreateTransportOrderRequest>
        </td>
    </tr>
    <tr>
      <td><code>GET /senderStatus/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
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
    <tr>
        <td><code>POST /event</code></td>
        <td>Creates the TMSEvents supplied in the request.
        Todo...
        </td>
    </tr>
    <tr>
        <td><code>GET /errorCodes</code></td>
        <td>Returns a dynamic list of error codes used in the solution.</td>
    </tr>
    </tbody>
  </table>
