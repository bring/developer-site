package com.bring.developer.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    
    @RequestMapping(value = "/home.html")
    public String home() {
        return "home";
    }
    
    @RequestMapping(value = "/learn.html")
    public String learn() {
        return "learn";
    }
    
    @RequestMapping(value = "/download.html")
    public String download() {
        return "download";
    }
    
    @RequestMapping(value = "/talk.html")
    public String talk() {
        return "talk";
    }
}