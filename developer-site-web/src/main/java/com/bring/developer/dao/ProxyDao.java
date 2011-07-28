package com.bring.developer.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.Validate;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class ProxyDao {
    
    public static final Logger LOG = LoggerFactory.getLogger(TwitterDao.class);
    HttpClient httpClient;

    @Autowired
    public void setHttpClient(HttpClient httpClient) {
        this.httpClient = httpClient;
    }
    
    public HttpResponse performRequest(String request) {
        Validate.notEmpty(request);
        HttpGet httpGet = new HttpGet(request);
        HttpResponse result = null;
        try {
            result = httpClient.execute(httpGet);
            failOnInvalidResponseHeader(result);
            return result;
        }
        catch (ClientProtocolException e) {
            throw new RuntimeException(e);
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    
    public String performRequestConsumeAndReturnAsString(String request) {
        return consumeResultAndReturnAsString(performRequest(request));
    }
    

    public String consumeResultAndReturnAsString(HttpResponse response) {
        try {
            InputStream content = response.getEntity().getContent();
            return IOUtils.toString(content, "UTF-8");
        } 
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        finally {
            consumeEntity(response);
        }
    }
    
    public byte[] consumeResultAndReturnAsByteArray(HttpResponse response) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int output = 0;
        InputStream inputStream;
        try {
            inputStream = response.getEntity().getContent();
            while((output = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, output);
            }
        } 
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        return outputStream.toByteArray();
    }

    private void consumeEntity(HttpResponse result) {
        try {
            if (result != null) {
                EntityUtils.consume(result.getEntity());
            }
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    
    abstract protected void failOnInvalidResponseHeader(HttpResponse result) throws IOException;
}