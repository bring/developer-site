<div>
    <h4>Delivery to Pickup Point in Denmark</h4>
    <p>
        The products CARRYON_HOMESHOPPING and CARRYON_HOMESHOPPING_BULKSPLIT support the deliveryOption=PICKUP_POINT for
        shipments within Denmark and to Denmark, respectively. The parcel will be delivered to the pickup point closest to
        the recipient address and the recipient will receive a notification when the parcel arrives.
        If you do not specify a delivery option for these products in Denmark, the package will be delivered to the door.
    </p>
    <h4>Delivery to Selected Pickup Point in Denmark</h4>
    <p>
        You can also specify a pickup point id to get the package delivered at a specific pickup point.
        Use <a  href="http://developer.bring.com/api/pickuppointapi.html#xml"> Pickup Point API </a>to get list of nearest pickup points.
        Pickup point id and country code has to be specified under <strong>pickupPoint</strong> element within parties element as shown below.
    </p>
    <strong>pickupPoint element is optional but both id and countryCode element inside it are mandatory.</strong>
    This element has precedence over deliveryOption=PICKUP_POINT i.e. if this element is present then pickup point specified in it will be selected irrespective
    of value set in deliveryOption.
    </p>
    <p>
        Pickup point delivery requires that the <strong>recipient has email and/or phone number set</strong>, so that he can receive notification
        when the package arrives at the pickup point.
    </p>
</div>
