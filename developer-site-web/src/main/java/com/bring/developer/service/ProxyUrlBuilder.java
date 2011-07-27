package com.bring.developer.service;

import java.util.Map;

public class ProxyUrlBuilder {
    public static final String TRACKING_URL = "http://sporing.bring.no/";
    public static final String SHIPPINGGUIDE_URL = "http://fraktguide.bring.no/fraktguide/";
    
    public String createUrl(String service, String path, Map<String, String> paramMap) {
        if (service.equals("shipping-guide") && !(path.startsWith("products/"))) {
            path = "api/" + path;
        }
        return getUrlForService(service) + path + paramsToQueryString(paramMap);
    }
    
    public String getUrlForService(String service) {
        if (service.equals("tracking")) {
            return TRACKING_URL;            
        }
        else if (service.equals("shipping-guide")) {
            return SHIPPINGGUIDE_URL;
        }
        return null;
    }

    public String paramsToQueryString(Map<String, String> paramMap) {
        String queryString = "";
        String[] keys = paramMap.keySet().toArray(new String[0]);
        if (keys.length > 0) {
            queryString += "?" + keys[0] + "=" + paramMap.get(keys[0]);
        }
        for (int i = 1; i < keys.length; i++) {
            queryString += "&" + keys[i] + "=" + paramMap.get(keys[i]);
        }
        return queryString;
    }
}