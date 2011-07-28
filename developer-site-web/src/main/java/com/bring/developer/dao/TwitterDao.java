package com.bring.developer.dao;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import com.bring.developer.exception.TwitterCacheMissException;
import com.googlecode.ehcache.annotations.Cacheable;

@Component
public class TwitterDao extends ProxyDao{
	
	@Cacheable(cacheName = "twitterCacheSearch")
	public String performSearch(String request) {
		return performRequestConsumeAndReturnAsString(request);
	}
	
	@Cacheable(cacheName = "twitterCacheStatus")
	public String performGetStatus(String request) {
	    return performRequestConsumeAndReturnAsString(request);
    }

	protected void failOnInvalidResponseHeader(HttpResponse result) throws IOException {
		if (result.containsHeader("X-Cache") && "MISS".equals(result.getFirstHeader("X-Cache").getValue())) {
			EntityUtils.consume(result.getEntity());
			throw new TwitterCacheMissException();
		}
	}
}