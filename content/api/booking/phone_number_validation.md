---
title: Phone number validation
layout: api-sub
menu:
  apidocs:
    identifier: bookingphonenumbervalidation
    title: Phone number validation
    parent: booking
weight: 3
---

To be able to do electronic notification (aAdvising), we validate receipient (for outbound services) mobile phone numbers in certain cases.
For recipient countries DK/SE we allow mobile phone numbers from all countries. For other recipient countries, we currently allow nordic phone numbers.

## Nordic services

### When
1. When sending an EVARSLING VAS (https://developer.bring.com/api/services/#eadvising)
2. When an optional pickup point is chosen - skal vi alltid (locker/non-locker)??
3. When a service has EVARSLING built-in (e.g. 0360)

### How
- We primarily look for country codes when validating. If this is missing, we'll assume the phone number is in the recipient country.
- For Nordic and Polish phone numbers, we have dedicated validation rules, closely aligned with our downstream systems
- For other country codes, we use https://libphonenumber.appspot.com/ to check whether the phone number has an acceptable form.

## Norwegian domestic

### When
1. When an optional pickup point is chosen - skal vi alltid (locker/non-locker)??
2. When the service has EVARSLING built-in (e.g 5800)
3. When the parcel is inherently destined for a locker (e.g. 5801)

### How
- We primarily look for country codes when validating. If this is missing, we'll assume the phone number is in the recipient country.
- For Nordic phone numbers, we have dedicated validation rules, closely aligned with our downstream systems
