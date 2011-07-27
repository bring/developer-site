package com.bring.developer.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;

import com.bring.developer.dao.ProxyDaoImpl;
import com.bring.developer.dao.TwitterDao;
import com.bring.developer.service.ProxyUrlTranslator;

@Controller
public class ProxyController{
    
    public static final Logger LOG = LoggerFactory.getLogger(TwitterDao.class);
    public static final String TRACKING_URL = "http://sporing.bring.no/";
    public static final String SHIPPINGGUIDE_URL = "http://fraktguide.bring.no/fraktguide/";    
    
    private ProxyDaoImpl proxyDao;

    @Autowired
    public ProxyController (ProxyDaoImpl proxyDao) {
        this.proxyDao = proxyDao;
    }
    
    
    @RequestMapping(value = "/api/{service}/**", method = RequestMethod.GET)
    public ResponseEntity<String> shippingGuideRequest(HttpServletRequest request,@PathVariable String service, @RequestParam Map<String, String> params) {
        // Request
        String requestPath = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String finalUrl = new ProxyUrlTranslator().createUrl(service, requestPath, params);
        HttpResponse response = proxyDao.performRequestRaw(finalUrl);
        //Header[] headers = response.getAllHeaders();
        String result = proxyDao.consumeResultAndReturnAsString(response);
        
        // Response
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.add("Content-Type", proxyDao.getMimeType(requestPath) + ";charset=utf-8");
        return new ResponseEntity<String>(result, headers, HttpStatus.OK);
    }
}
