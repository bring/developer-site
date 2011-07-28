package com.bring.developer.request;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.request.ProxyUrlBuilder;


public class ProxyUrlTranslatorTest {
    
    ProxyUrlBuilder proxyTranslator;
    
    @Before
    public void setup(){
        proxyTranslator = new ProxyUrlBuilder();        
    }
    
    @Test
    public void shouldGetCorrectUrlForTrackingService() {
        assertEquals("http://sporing.bring.no", proxyTranslator.getUrlForService("tracking"));
    }   
    
    @Test
    public void shouldTranslateEmptyParameterMapToEmptyString() {
        Map<String, String> paramMap = new HashMap<String, String>();
        String result = proxyTranslator.paramsToQueryString(paramMap);
        assertTrue(result.isEmpty());
    }
    
    @Test
    public void shouldTranslateOneParameterToQueryStringWithoutAndSign() {
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("from", "1234");
        String result = proxyTranslator.paramsToQueryString(paramMap);
        assertEquals("?from=1234", result);
    }
    
    @Test
    public void shouldTranslateParameterMapToQueryString(){
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("from", "1234");
        paramMap.put("to", "4321");
        String result = proxyTranslator.paramsToQueryString(paramMap);
        assertTrue(result.startsWith("?"));
        assertTrue(result.contains("from=1234"));
        assertTrue(result.contains("to=4321"));
        assertTrue(result.contains("&"));
    }
    
    @Test
    public void shouldGetUrlWithoutApiPathElementForNormalShippingGuideRequest() {
//        assertEquals("http://fraktguide.bring.no/fraktguide", proxyTranslator.getUrl(""))
    }
    
    @Test
    public void shouldCreateCorrectUrlWithoutParameters() {
        String path = "products/SERVICEPAKKE/price.json";
        String expected = "http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.json";
        assertEquals(expected, proxyTranslator.createUrl("shipping-guide", path, new HashMap<String,String>()));
    }
    
    @Test
    public void shouldCreateCorrectUrlWithMultipleParameters() {
        String path = "products/SERVICEPAKKE/price.json";
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("from", "1234");
        paramMap.put("to", "4321");
        String expected = "http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.json?";
        String result = proxyTranslator.createUrl("shipping-guide", path, paramMap);
        assertTrue(result.startsWith(expected));
        assertTrue(result.contains("&"));
        assertTrue(result.contains("from=1234"));
        assertTrue(result.contains("to=4321"));
    }
    
    
    @Test
    public void shouldCreateCorrectUrlForPostalcodeService() {
        String path = "api/pickuppoint/postalcode/1407.xml";
        String expected = "http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml";
        assertEquals(expected, proxyTranslator.createUrl("shipping-guide", path, new HashMap<String,String>()));
    }
}
