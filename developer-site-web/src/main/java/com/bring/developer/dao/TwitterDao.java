package com.bring.developer.dao;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.bring.developer.exception.TwitterCacheMissException;
import com.googlecode.ehcache.annotations.Cacheable;

@Component
public class TwitterDao extends ProxyDao{
	
    public static final Logger LOG = LoggerFactory.getLogger(TwitterDao.class);
    	
	@Cacheable(cacheName = "twitterCacheSearch")
	public String performSearch(String request) {
		return performRequest(request);
	}
	
	@Cacheable(cacheName = "twitterCacheStatus")
	public String performGetStatus(String request) {
	    return performRequest(request);
    }

	protected void failOnInvalidResponseHeader(HttpResponse result) throws IOException {
		if (result.containsHeader("X-Cache") && "MISS".equals(result.getFirstHeader("X-Cache").getValue())) {
			EntityUtils.consume(result.getEntity());
			throw new TwitterCacheMissException();
		}
	}
}
