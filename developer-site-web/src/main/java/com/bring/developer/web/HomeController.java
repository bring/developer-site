package com.bring.developer.web;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.ApiReferenceDao;
import com.bring.developer.response.Document;

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

    /**
     * @todo Add RequestParam (so that the controller can open other XML files)
     * @param model
     * @return
     * @throws JAXBException
     */
    @RequestMapping(value = "/learn/shippingguide/apireference.html")
    public String apiReference(ModelMap model) throws JAXBException {
        Document document = dao.query("shippingguide");
        model.put("document", document);
        return "learn/shippingguide/apireference";
    }
}