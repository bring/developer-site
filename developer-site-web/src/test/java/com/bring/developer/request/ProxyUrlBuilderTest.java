package com.bring.developer.request;

import org.junit.Before;
import org.junit.Test;
import java.util.HashMap;
import java.util.Map;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


public class ProxyUrlBuilderTest {
    ProxyUrlBuilder proxyUrlBuilder;
    
    @Before
    public void setup(){
        proxyUrlBuilder = new ProxyUrlBuilder();
        proxyUrlBuilder.addService("tracking", "http://sporing.bring.no");
        proxyUrlBuilder.addService("shipping-guide", "http://fraktguide.bring.no/fraktguide");
    }
    
    @Test
    public void shouldGetCorrectUrlForTrackingService() {
        assertEquals("http://sporing.bring.no", proxyUrlBuilder.getUrlForService("tracking"));
    }   
    
    @Test
    public void shouldTranslateEmptyParameterMapToEmptyString() {
        Map<String, String[]> paramMap = new HashMap<String, String[]>();
        String result = proxyUrlBuilder.paramsToQueryString(paramMap);
        assertTrue(result.isEmpty());
    }

    @Test
    public void shouldTranslateOneParameterToQueryStringWithoutAndSign() {
        Map<String, String[]> paramMap = new HashMap<String, String[]>();
        paramMap.put("from", new String[] {"1234"});
        String result = proxyUrlBuilder.paramsToQueryString(paramMap);
        assertEquals("?from=1234", result);
    }

    @Test
    public void shouldTranslateParameterMapToQueryString(){
        Map<String, String[]> paramMap = new HashMap<String, String[]>();
        paramMap.put("from", new String[] {"1234"});
        paramMap.put("to", new String[] {"4321"});
        String result = proxyUrlBuilder.paramsToQueryString(paramMap);
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
        assertEquals(expected, proxyUrlBuilder.createUrl("shipping-guide", path, new HashMap<String,String[]>()));
    }

    @Test
    public void shouldCreateCorrectUrlWithMultipleParameters() {
        String path = "products/SERVICEPAKKE/price.json";
        Map<String, String[]> paramMap = new HashMap<String, String[]>();
        paramMap.put("from", new String[] {"1234"});
        paramMap.put("to", new String[] {"4321"});
        String expected = "http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.json?";
        String result = proxyUrlBuilder.createUrl("shipping-guide", path, paramMap);
        assertTrue(result.startsWith(expected));
        assertTrue(result.contains("&"));
        assertTrue(result.contains("from=1234"));
        assertTrue(result.contains("to=4321"));
    }

    @Test
    public void shouldCreateCorrectUrlForPostalcodeService() {
        String path = "api/pickuppoint/postalcode/1407.xml";
        String expected = "http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml";
        assertEquals(expected, proxyUrlBuilder.createUrl("shipping-guide", path, new HashMap<String,String[]>()));
    }

    @Test
    public void shouldBeAbleToNewAddService() {
        String service = "the new service";
        proxyUrlBuilder.addService(service, "http://service/url");
        assertEquals("http://service/url", proxyUrlBuilder.getUrlForService(service));
    }
}