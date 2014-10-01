<div>
    <h4> Dangerous Goods </h4>
        <p>
           If you want to book shipment for sending dangerous goods you have to use <strong>dangerousGoods</strong> element under services.
        </p>
           You can specify below fields for dangerous goods :

            <table class="dangerous-goods">
                <tbody>
                    <tr>
                        <th>Field</th>
                        <th class="dangerous-goods-usage" >Usage</th>
                        <th>Is Mandatory</th>
                    </tr>
                    <tr>
                        <td>Weight (gm) </td>
                        <td>  { "weightInGrams": 500000, } </td>
                        <td> Yes </td>
                    </tr>
                    <tr>
                        <td>UN Number</td>
                        <td> { "unNumber": "1560", } </td>
                        <td> Yes </td>
                    </tr>
                    <tr>
                        <td>Commodity</td>
                        <td> { "commodity": "ARSENTRIKLORID", } </td>
                        <td> Yes </td>
                    </tr>
                    <tr>
                        <td>Danger Class</td>
                        <td> { "dangerClass": "1", } </td>
                        <td> Yes </td>
                    </tr>
                    <tr>
                        <td>Packing Group</td>
                        <td> { "packingGroup": "I", } </td>
                        <td> Yes </td>
                    </tr>
                    <tr>
                        <td>Tunnel Restriction Code</td>
                        <td> { "tunnelRestrictionCode": "C/E", } </td>
                        <td> No </td>
                    </tr>
                    <tr>
                        <td>Safety Mark Code</td>
                        <td> { "safetyMarkCode": "6.1", } </td>
                        <td> No </td>
                    </tr>
                    <tr>
                        <td>Factor</td>
                        <td> { "factor": 50, } </td>
                        <td> No </td>
                    </tr>
                    <tr>
                        <td>Container Id</td>
                        <td> { "containerId": "1234", }  </td>
                        <td> Yes-Only for Oil Express </td>
                    </tr>
                </tbody>
            </table>
        <p>
            You can refer <a href="http://www.dsb.no/farliggods" >this</a> for more information on transporting dangerous goods in Norway.
        </p>
        <p>
        <strong>For Oil Express product container id is mandatory and it contains id of container which is carrying dangerous goods.</strong>
        </p>
</div>