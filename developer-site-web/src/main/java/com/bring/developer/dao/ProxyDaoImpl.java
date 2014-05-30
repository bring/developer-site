package com.bring.developer.dao;

import com.bring.developer.config.ApplicationConfig;
import com.bring.developer.request.ProxyUrlBuilder;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;

import java.io.IOException;
import java.util.Map;

@Component
public class ProxyDaoImpl extends ProxyDao {

    private ProxyUrlBuilder urlBuilder;
    
    @Autowired
    public ProxyDaoImpl(ApplicationConfig config) {
        super();
        urlBuilder = new ProxyUrlBuilder();
        urlBuilder.addService("pickuppoint", config.getPickupPointUrlForEnvironment());
        urlBuilder.addService("tracking", config.getTrackingUrlForEnvironment());
        urlBuilder.addService("shipping-guide", config.getFraktguideUrlForEnvironment());
        urlBuilder.addService("booking", config.getBookingUrlForEnvironment());
        urlBuilder.addService("purchaseorder", config.getPurchaseorderUrlForEnviroment());
    }
    
    public ProxyDaoImpl(ProxyUrlBuilder urlBuilder) {
        super();
        this.urlBuilder = urlBuilder;
    }
    
    @Override
    protected void failOnInvalidResponseHeader(HttpResponse result)  throws IOException {
        // Ignore invalid headers
    }
    
    public ResponseEntity<byte[]> performRequest(String service, String requestPath, Map<String,String[]> requestParams) {
        HttpResponse response = performRequest(urlBuilder.createUrl(service, requestPath, requestParams));
        MultiValueMap<String, String> headers = translateHeaders(response.getAllHeaders());
        HttpStatus httpStatus = HttpStatus.valueOf(response.getStatusLine().getStatusCode());
        return new ResponseEntity<byte[]>(consumeResultAndReturnAsByteArray(response), headers, httpStatus);
    }

    private MultiValueMap<String, String> translateHeaders(Header[] responseHeaders) {
        MultiValueMap<String, String> headers = new HttpHeaders();
        for (Header header: responseHeaders) {
            headers.add(header.getName(), header.getValue());
        }
        return headers;
    }
}