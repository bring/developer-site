package com.bring.developer.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBException;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;

import com.bring.developer.dao.TwitterDao;
import com.bring.developer.dao.XmlDao;
import com.bring.developer.response.pack.Pack;

@Controller
public class ProxyController {
    
    public static final Logger LOG = LoggerFactory.getLogger(TwitterDao.class);
    
    HttpClient httpClient;

    @Autowired
    public ProxyController (HttpClient httpClient) {
        this.httpClient = httpClient;
    }
    
    @RequestMapping(value = "/api/**", method = RequestMethod.GET)
    public ResponseEntity<String> shippingGuideRequest(HttpServletRequest request, @RequestParam Map<String, String> params) {
        
        String parameters = "";
        int i = 0;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if(i==0){
                parameters += "?" + entry.getKey() + "=" + entry.getValue();                
            }
            else if(i>0){
                parameters += "&" + entry.getKey() + "=" + entry.getValue();
            }
            i++;
        }
        
        String restOfTheUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        int dot = restOfTheUrl.lastIndexOf(".");
        String fileExtension = restOfTheUrl.substring(dot + 1);
        
        String result = performRequest("http://fraktguide.bring.no/fraktguide/api/" + restOfTheUrl + parameters);
        
        //TODO: fix headers
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.add("Content-Type", "application/" + fileExtension + ";charset=utf-8");
        return new ResponseEntity<String>(result, headers, HttpStatus.OK);
    }
    
    /*
    
    @RequestMapping(value = "/api/pickuppoint/postalcode/{postalcode}.{extension}", method = RequestMethod.GET)
    public ResponseEntity<String> search(
            @PathVariable String postalcode, 
            @PathVariable String extension, 
            @RequestParam Map<String, String> params) {
        
        String parameters = "";
        int i = 0;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if(i==0){
                parameters += "?" + entry.getKey() + "=" + entry.getValue();                
            }
            else if(i>0){
                parameters += "&" + entry.getKey() + "=" + entry.getValue();
            }
        }
        
        
        LOG.info("Performing Fraktguide request: " + "http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/"+postalcode+"."+extension+parameters);
        
        String result = performRequest("http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/"+postalcode+"."+extension+parameters);
        MultiValueMap<String, String> headers = new HttpHeaders();
        
        //TODO: fix headers
        headers.add("Content-Type", "application/" + extension + ";charset=utf-8");
        return new ResponseEntity<String>(result, headers, HttpStatus.OK);
    }
    */
    
    
    private String performRequest(String request) {
        System.out.println("perform request");
        Validate.notEmpty(request);
        HttpGet httpGet = new HttpGet(request);
        HttpResponse result = null;
        try {
            LOG.info("Performing Fraktguide request: " + request);
            result = httpClient.execute(httpGet);
            return IOUtils.toString(result.getEntity().getContent(), "UTF-8");
        }
        catch (ClientProtocolException e) {
            throw new RuntimeException(e);
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
        finally {
            consumeEntity(result);
        }
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

}
