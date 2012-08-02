<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The Booking API is a logged-in service and you need to get an API-key and authenticate before being able to use the
    API. Read more about <a href="/additionalresources/getting-api-keys.html?from=booking">how to get an API-key</a>,
    and how to use it for authentication. </p>

<h4>Authorization - by customer numbers (per specialist)</h4>

<p>
    In addition to authentication, you need to be authorized with the BUYER role in order to perform bookings.
    Read about <a href="/additionalresources/getting-api-keys.html?from=booking#buyer">how to get authorized with the buyer role</a>.
    The authorization is currently handled with customer numbers on a per specialist basis. </p>

<p>
    To perform a booking, you must specify which customer number to use. For your convenience, there is an API for
    getting the customer numbers associated with your mybring user (the customer numbers your mybring user has access
    to). The Customer number API also links customer numbers with the products the customer number is valid for. </p>