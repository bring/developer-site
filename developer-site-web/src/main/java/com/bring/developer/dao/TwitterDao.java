package com.bring.developer.dao;

import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.Validate;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bring.developer.exception.TwitterCacheMissException;

@Component
public class TwitterDao {
	
	HttpClient httpClient;

	@Autowired
	public TwitterDao(HttpClient httpClient) {
		this.httpClient = httpClient;
	}

	public String performSearch(String query) {
		Validate.notEmpty(query);
		HttpGet httpGet = new HttpGet("http://search.twitter.com/search.json?q=" + query);
		HttpResponse result = null;
		try {
			result = httpClient.execute(httpGet);
			validateTwitterResult(result);
			return IOUtils.toString(result.getEntity().getContent(), "UTF-8");
		}
		catch (ClientProtocolException e) {
			throw new RuntimeException(e);
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		finally {
			consumeEntity(result);
		}
	}

	private void consumeEntity(HttpResponse result) {
		try {
			if (result != null) {
				EntityUtils.consume(result.getEntity());
			}
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	private void validateTwitterResult(HttpResponse result) throws IOException {
		if (result.containsHeader("X-Cache") && "MISS".equals(result.getFirstHeader("X-Cache").getValue())) {
			EntityUtils.consume(result.getEntity());
			throw new TwitterCacheMissException();
		}
	}	
}
