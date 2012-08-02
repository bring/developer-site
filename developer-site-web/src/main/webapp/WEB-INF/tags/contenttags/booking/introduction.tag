<p>
        The Bring Booking API is a logged-in service that lets mybring-users (customers of mybring.com) programmatically
        create a booking by invoking a Web Service over SOAP or by posting XML/JSON over HTTP. The API uses the same
        backend as Bring Booking web (beta.bring.no/booking) and the same PDF labels. </p>

    <p>
        We support two types of integration with the Booking API. <b>XML/JSON over HTTP</b> and <b>SOAP (over HTTP)</b>.
    </p>
    <p>
        Bring Booking uses Bring Fraktguide as the source for price and availability for the different products. We
        advise clients of the Booking API to use Fraktguiden for getting the list price and checking availability before
        sending a booking request. Note that invoice payment is the only available payment option for the Booking API.
        This means that the mybring user ID used in the booking request must have access to the customer number
        specified as payer of the booking. </p>


    <div class="information-box">BETA! This API is currently in BETA, which means that even though the code is in production and fully functional,
                                 changes might be made in the future that can break code relying on this specific version.</div>