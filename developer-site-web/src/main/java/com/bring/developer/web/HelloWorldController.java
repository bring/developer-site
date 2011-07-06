package com.bring.developer.web;

import com.bring.developer.HelloWorldService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/index.html")
public class HelloWorldController {

    public static final Logger LOG = LoggerFactory.getLogger(HelloWorldController.class);

    private final HelloWorldService service;

    @Autowired
    public HelloWorldController(HelloWorldService service) {
        LOG.info("Controller initialized");
        this.service = service;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getCreateForm() {
        return "helloWorld";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String helloWorld(@RequestParam("name") String n, Model model) {
        String m = service.getMessageForName(n);

        model.addAttribute("message", m);
        model.addAttribute("name", n);

        return "helloWorld";
    }
}