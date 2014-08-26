<div>
  <h4>Delivery to pickup point in Denmark</h4>
  <p>
    The products CARRYON_HOMESHOPPING and CARRYON_HOMESHOPPING_BULKSPLIT support the deliveryOption=PICKUP_POINT for
    shipments within Denmark and to Denmark, respectively. The parcel will be delivered to the pickup point closest to
    the recipient address and the recipient will receive a notification when the parcel arrives.
    If you do not specify a delivery option for these products in Denmark, the package will be delivered to the door.
  </p>
  <p>
      You can also specify a pickup point id to get the package delivered at a specific pickup point.
      To get pickup points Id use <a  href="http://developer.bring.com/api/pickuppointapi.html#xml"> Pickup point API.  </a>
      Pickup point id and country code has to be specified under <strong>pickupPoint</strong> tag within parties tag.Please refer to deliveryOptionRequest.xml below.
   </p> 
  <p>
    Pickup point delivery requires that the <strong>recipient has email and/or phone number set</strong>, so that he can receive notification
    when the package arrives at the pickup point.
  </p>

  <h4>Attempted delivery</h4>
    <p>
        If a sender want their package delivered to the door, and it cannot be delivered (i.e. Business closed or recipient is not present),
        then you can now choose what will happen with your package.<br>
        <br>
        If this option is not set, then the default behaviour is TWO_DELIVERIES_THEN_RETURN.<br>
        <br>
        If you want Bring to try deliver only once and/or deliver package to nearest PiB, then you must tell us by setting this option. These options
        cost extra money but the customer/sender will only be charged if the event happen.<br>
        <br>
        Example:<br>
        You send a package to a business with the deliveryOption=TWO_DELIVERIES_THEN_PIB.<br>
        - If Bring manage to deliver the package to the recipient on first try, then no extra charges is made.<br>
        - If first attempt to deliver fails, then Bring will do a second attempt. The customer/sender will be charged extra.<br>
        - If the second attempt also fails, then the package will be delivered to nearest PiB. The customer/sender will be charged extra.<br>
        <br>
        Possible options:<br>
        - Not set = TWO_DELIVERIES_THEN_RETURN<br>
        - ONE_DELIVERY_THEN_PIB<br>
        - TWO_DELIVERIES_THEN_PIB<br>
        - TWO_DELIVERIES_THEN_RETURN<br>
    </p>
</div>