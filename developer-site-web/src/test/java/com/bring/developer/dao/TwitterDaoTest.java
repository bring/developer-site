package com.bring.developer.dao;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import java.io.UnsupportedEncodingException;

import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHttpResponse;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Matchers;
import org.mockito.Mock;

import com.bring.developer.exception.TwitterCacheMissException;

public class TwitterDaoTest {

    private TwitterDao dao;

    @Mock
    HttpClient httpClientMock;

    @Before
    public void setup() {
        initMocks(this);
        dao = new TwitterDao();
        dao.setHttpClient(httpClientMock);
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowExceptionWhenQueryIsNull() {
        dao.performSearch(null);
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowExceptionWhenQueryIsEmpty() {
        dao.performSearch("");
    }

    @Test(expected = TwitterCacheMissException.class)
    public void shouldReturnErrorWhenCacheMissByTwitter() throws Exception {
        HttpResponse response = createCacheMissResponse();
        when(httpClientMock.execute(Matchers.any(HttpUriRequest.class))).thenReturn(response);

        dao.performSearch("%40bringapi");
    }

    @Test
    public void shouldReturnResultWhenSuccessfulQuery() throws Exception {
        HttpResponse response = createValidResponse();
        when(httpClientMock.execute(Matchers.any(HttpUriRequest.class))).thenReturn(response);

        String result = dao.performSearch("%40bringapi");

        assertEquals("{result : 'Ø'}", result);
    }
/*
    @Test
	public void shouldGenerateCorrectUrlFromQuery() throws Exception {
        HttpResponse response = createValidResponse();
        ArgumentCaptor<HttpUriRequest> captor = ArgumentCaptor.forClass(HttpUriRequest.class);
        when(httpClientMock.execute(captor.capture())).thenReturn(response);
        dao.performSearch("from:bringapi%20OR%20%40bringapi");
        
        assertEquals("http://search.twitter.com/search.json?q=from:bringapi%20OR%20%40bringapi", captor.getValue().getURI().toASCIIString());
        
	}*/

    private HttpResponse createCacheMissResponse() throws UnsupportedEncodingException {
        HttpResponse response = new BasicHttpResponse(new ProtocolVersion("Http", 1, 1), 200, "OK");
        response.setEntity(new StringEntity("{result : 'Ø'}", "UTF-8"));
        response.setHeader("X-Cache", "MISS");
        return response;
    }

    private HttpResponse createValidResponse() throws UnsupportedEncodingException {
        HttpResponse response = new BasicHttpResponse(new ProtocolVersion("Http", 1, 1), 200, "OK");
        response.setEntity(new StringEntity("{result : 'Ø'}", "UTF-8"));
        response.setHeader("X-Cache", "HIT");
        return response;
    }

}
