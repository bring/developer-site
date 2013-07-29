<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="suffix" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<pre class="code-box">Request prefix:
https://api.qa.bring.com/po/api/v1/</pre>

  <table>
    <thead>
    <tr>
      <th>Field</th>
      <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><code>/order/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns the 10 nearest pickup points based on the given postalcode.
        <ul>
          <li>
            <code>&lt;postalcode&gt;</code> = any valid postal code
          </li>
          <li>
            <code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code>
          </li>
        </ul>
      </td>
    </tr>
    <tr >
      <td><code>/items/&lt;customernumber&gt;/&lt;purchaseordernumber&gt;</code></td>
      <td>Returns the 10 nearest pickup points based on the given location.
        <ul>
          <li>
            <code>&lt;latitude&gt;</code> = geographic coordinate specifying the north-south position.
          </li>
          <li><code>&lt;longitude&gt;</code> = geographic coordinate specifying the east-west position.
          </li>
          <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>/transport/&lt;id&gt;.&lt;extension&gt;</code></td>
      <td>Returns information about the pickup point based on the pickup point's id.
        <ul>
          <li>
            <code>&lt;id&gt;</code> = The pickup point's id.
          </li>
          <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>/event/&lt;id&gt;.&lt;extension&gt;</code></td>
      <td>Returns information about the pickup point based on the pickup point's id.
        <ul>
          <li>
            <code>&lt;id&gt;</code> = The pickup point's id.
          </li>
          <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
        </ul>
      </td>
    </tr>
    </tbody>
  </table>
