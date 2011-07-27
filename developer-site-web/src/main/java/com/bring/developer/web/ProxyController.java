package com.bring.developer.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;

import com.bring.developer.dao.ProxyDaoImpl;

@Controller
public class ProxyController{
    private ProxyDaoImpl proxyDao;

    @Autowired
    public ProxyController (ProxyDaoImpl proxyDao) {
        this.proxyDao = proxyDao;
    }
    
    @RequestMapping(value = "/api/{service}/**", method = RequestMethod.GET)
    public ResponseEntity<String> shippingGuideRequest(HttpServletRequest request,@PathVariable String service, @RequestParam Map<String, String> params) {
        String requestPath = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        return proxyDao.performRequest(service, requestPath, params);
    }
}