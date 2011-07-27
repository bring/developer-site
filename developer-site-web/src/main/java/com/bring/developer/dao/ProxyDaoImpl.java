package com.bring.developer.dao;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.springframework.stereotype.Component;

@Component
public class ProxyDaoImpl extends ProxyDao {

    public String getMimeType(String requestPath) {
        int dot = requestPath.lastIndexOf(".");
        String fileExtension = requestPath.substring(dot + 1);
        return "application/" + fileExtension;
    }  
    
    @Override
    protected void failOnInvalidResponseHeader(HttpResponse result)
            throws IOException {
        // TODO Auto-generated method stub
        
    }

}
