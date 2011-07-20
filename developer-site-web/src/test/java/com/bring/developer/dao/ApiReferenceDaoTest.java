package com.bring.developer.dao;

import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.response.Document;
import com.bring.developer.response.Example;
import com.bring.developer.response.Parameter;


public class ApiReferenceDaoTest {
    private ApiReferenceDao dao;
    
    @Before
    public void setUp() {
        dao = new ApiReferenceDao();
    }

    @Test
    public void shouldReturnPostalCodeFromShippingguide() throws JAXBException {
        Document document = dao.query("shippingguide");
        String title = document.getParameters().get(0).getTitle();
        assertEquals("Postal code", title);
        System.out.println(document.getParameters().get(0).getExamples().get(1).getContent());
    } 
 
    @Test
    public void shouldNotFailOnMissingContent() throws JAXBException {
        Document document = dao.query("shippingguide");
        assertEquals(null, document.getParameters().get(0).getExamples().get(0).getContent());
    }
    
    @Test
    public void shouldTrimContent() throws JAXBException {
        Document document = dao.query("trim");
        assertEquals("Foo", document.getParameters().get(0).getExamples().get(0).getContent());
    }
    
    @Test
    public void shouldBeAbleToGetParameterDirectlyFromDocument() throws JAXBException {
        Document document = dao.query("trim");
        assertTrue(document.getParameter(0) instanceof Parameter);
    }
    
    @Test
    public void shouldBeAbleToGetExampleDirectlyFromParameter() throws JAXBException {
        Document document = dao.query("trim");
        assertTrue(document.getParameter(0).getExample(0) instanceof Example);
    }
}