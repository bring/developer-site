package com.bring.developer.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.response.apireference.Api;
import com.bring.developer.response.apireference.Example;
import com.bring.developer.response.apireference.Parameter;


public class XmlDaoApiReferenceTest {
    private XmlDao<Api> dao;
    private Api api;
    private Api trimApi;
    
    @Before
    public void setUp() throws JAXBException {
        dao = new XmlDao<Api>(Api.class);
        api = dao.query("apireference");
        trimApi = dao.query("apireference-trim");
    }

    @Test
    public void shouldReturnPostalCodeFromShippingguide() {
        String title = api.getParameters().get(0).getTitle();
        assertEquals("Postal code", title);
        System.out.println(api.getParameters().get(0).getExamples().get(1).getContent());
    } 
 
    @Test
    public void shouldNotFailOnMissingContent() {
        assertEquals(null, api.getParameters().get(0).getExamples().get(0).getContent());
    }
    
    @Test
    public void shouldTrimContent() {
        assertEquals("Foo", trimApi.getParameters().get(0).getExamples().get(0).getContent());
    }
    
    @Test
    public void shouldBeAbleToGetParameterDirectlyFromDocument() {
        assertTrue(trimApi.getParameter(0) instanceof Parameter);
    }
    
    @Test
    public void shouldBeAbleToGetExampleDirectlyFromParameter() {
        assertTrue(trimApi.getParameter(0).getExample(0) instanceof Example);
    }
}