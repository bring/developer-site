package com.bring.developer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class HelloWorldService {

    public static final Logger LOG = LoggerFactory.getLogger(HelloWorldService.class);

    public HelloWorldService() {
        LOG.info("Initializing service");
    }

    public String getMessageForName(String name) {
		return "Hello " + name;
	}

}