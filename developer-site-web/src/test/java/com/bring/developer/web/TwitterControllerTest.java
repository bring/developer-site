package com.bring.developer.web;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import org.junit.Before;
import org.mockito.Mock;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.bring.developer.dao.TwitterDao;

public class TwitterControllerTest {
    
    @Mock
    TwitterDao twitterDao;
    

    @Before
    public void setup() {
        initMocks(this);
    }
    
    public void shouldReturnResponseEntity() {
        TwitterController twitterController = new TwitterController(twitterDao);
        when(twitterDao.performSearch("http://search.twitter.com/search.json?q=from:bringapi%20OR%20%40bringapi")).thenReturn("{ result : []}");
        ResponseEntity<String> response = twitterController.search();
        
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals("application/json;charset=utf-8", response.getHeaders().getContentType().toString());
        assertEquals("{ result : []}", response.getBody());
    }
}
