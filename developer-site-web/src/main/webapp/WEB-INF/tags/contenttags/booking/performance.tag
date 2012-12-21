<%@ tag language="java" pageEncoding="UTF-8"%>

<div>

    <h4>Performance</h4>

    Different product groups have different response times in booking:
    <table>
        <tbody>
        <tr>
            <td>Parcels and Courier products</td>
            <td>A booking will typically take &lt; 2 seconds</td>
        </tr>
        <tr>
            <td>QuickPack UPS products and Cargo</td>
            <td>A booking will typically take &lt; 3 seconds</td>
        </tr>
        <tr>
            <td>QuickPack SameDay</td>
            <td>
              A booking will typically take &lt; 10 seconds (query in flight schedules). We are working on improving the response times for QuickPack SameDay,
              making popular city-pairs much faster.
            </td>
        </tr>
        </tbody>
    </table>
</div>
