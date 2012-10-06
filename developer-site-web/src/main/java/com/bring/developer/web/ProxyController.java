package com.bring.developer.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;

import com.bring.developer.dao.ProxyDaoImpl;

@Controller
public class ProxyController{
    private static final String PROXY_SERVICE_PATH = "/proxy/{service}/**";
    private ProxyDaoImpl proxyDao;

    @Autowired
    public ProxyController(ProxyDaoImpl proxyDao) {
        this.proxyDao = proxyDao;
    }
    
    @RequestMapping(value = PROXY_SERVICE_PATH, method = RequestMethod.GET)
    public ResponseEntity<byte[]> apiRequest(HttpServletRequest request, @PathVariable("service") String service) {
        String path = new AntPathMatcher().extractPathWithinPattern(PROXY_SERVICE_PATH, request.getServletPath());

        Map<String, String[]> parameters = request.getParameterMap();
        return proxyDao.performRequest(service, path, parameters);
    }
}