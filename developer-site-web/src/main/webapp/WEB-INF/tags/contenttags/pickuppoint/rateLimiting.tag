<%@ tag language="java" pageEncoding="UTF-8"%>

<p>The Pickup point API has a rate limit, primarily considered on a per-user basis. Currently it limits API users to no more than 60 requests
    within a minute from a single IP address.</p>

<p>Once you go over the rate limit, you will receive a response with an HTTP response code of 429 (Too Many Requests). The body of the response will
  consist of the following fields:

<table>
    <tbody>

        <tr>
          <th>Field</th>
          <th>Value</th>
        </tr>

        <tr>
          <td>code</td>
          <td>429</td>
        </tr>

        <tr>
          <td>error_message</td>
          <td>The maximum number of requests per hour has been exceeded.</td>
        </tr>

    </tbody>
</table>


<p>Also, product List should always be shown regardless of the fact that you have been rate limited or on the
    availability of the Pickup Point.</p>

<h3>High-volume users</h3>

    <p>If you're a high-volume user of the pickup point API, please contact the Customer Service at
        <a href="http://developer.bring.com/support">http://developer.bring.com/support</a>
        to discuss your options.</p>

    <p>When contacting Bring support include a description of how you are using the Pickup Point API, also an
        estimate of current request volumes.</p>

</p>