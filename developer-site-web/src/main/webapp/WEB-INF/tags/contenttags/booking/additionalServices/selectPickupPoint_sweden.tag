<div>
    <h4>Delivery to Pickup Point in Sweden</h4>
    <p>
        You can specify pickup point Id in request for CARRYON_HOMESHOPPING and CARRYON_HOMESHOPPING_BULKSPLIT products for delivery of parcels within Sweden and to Sweden from other countries.
        Use <a  href="http://developer.bring.com/api/pickuppointapi.html#xml"> Pickup Point API </a>to get list of nearest pickup points.
    </p>
    <p>
        The parcel will be delivered to the pickup point specified in the request with SMS/Email notification.
        Pickup point delivery requires that the <strong>recipient has email and/or phone number set</strong>, so that he can receive notification
        when the package arrives at the pickup point.
    </p>
    <p>
        Pickup point id and country code has to be specified under <strong>pickupPoint</strong> element within <strong>parties</strong> element as shown below.
    </p>

</div>
