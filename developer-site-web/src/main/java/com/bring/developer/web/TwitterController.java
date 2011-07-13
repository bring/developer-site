package com.bring.developer.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.bring.developer.dao.TwitterDao;
import com.bring.developer.exception.TwitterCacheMissException;

@Controller
public class TwitterController {
    
    public static final Logger LOG = LoggerFactory.getLogger(TwitterDao.class);
    TwitterDao twitterDao;
    
    @Autowired
    public TwitterController(TwitterDao twitterDao) {
        this.twitterDao = twitterDao;
    }
    
    @RequestMapping(value = "/twitter/search.json")
    public ResponseEntity<String> search() {
        String result = twitterDao.performSearch("from:bringapi%20OR%20%40bringapi");
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=utf-8");
        return new ResponseEntity<String>(result, headers, HttpStatus.OK);
    }
    
    @ExceptionHandler(TwitterCacheMissException.class)
    @ResponseStatus(HttpStatus.PARTIAL_CONTENT)
    public String twitterCacheMiss() {
        LOG.info("TwitterCacheMiss");
        return "json/twitterCacheMiss";
    }
}
