package com.bring.developer.web;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.ApiReferenceDao;

@Controller
public class HomeController {
    ApiReferenceDao dao = new ApiReferenceDao();
    
    @RequestMapping(value = "/home.html")
    public String home() {
        return "home";
    }
    @RequestMapping(value = "/talk.html")
    public String talk() {
        return "talk";
    }
    
    @RequestMapping(value = "/learn/tracking/index.html")
    public String tracking() {
        return "learn/tracking/index";
    }
    
    @RequestMapping(value = "/learn/shippingguide/apireference.html")
    public String apiReference(ModelMap model) throws JAXBException {
        model.put("document", dao.query("shippingguide"));
        return "learn/shippingguide/apireference";
    }
}