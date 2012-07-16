package com.bring.developer.request;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class ProxyUrlBuilder {
    private Map<String,String> services;
    
    public ProxyUrlBuilder() {
        setServices(new HashMap<String, String>());
    }
    
    public String createUrl(String service, String path, Map<String, String[]> paramMap) {
        if (!path.isEmpty()) {
            path = "/" + path;
        }
        return getUrlForService(service) + path + paramsToQueryString(paramMap);
    }
    
    public String getUrlForService(String service) {
        return getServices().get(service);
    }

    public String paramsToQueryString(Map<String, String[]> paramMap) {
        String queryString = "";
        String[] keys = paramMap.keySet().toArray(new String[0]);
        if (keys.length > 0) {
            for(int j = 0; j < paramMap.get(keys[0]).length; j++){
                queryString += "?" + keys[0] + "=" + paramMap.get(keys[0])[j];
            }
        }
        for (int i = 1; i < keys.length; i++) {
            for(int j = 0; j < paramMap.get(keys[i]).length; j++){
                queryString += "&" + keys[i] + "=" + paramMap.get(keys[i])[j];
            }
        }
        return queryString;
    }

    public void addService(String service, String url) {
        getServices().put(service, url);
    }

    public Map<String,String> getServices() {
        return services;
    }

    public void setServices(Map<String,String> services) {
        this.services = services;
    }
}