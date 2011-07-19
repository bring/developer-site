package com.bring.developer.dao;

import static org.junit.Assert.assertEquals;

import javax.xml.bind.JAXBException;

import org.junit.Test;

import com.bring.developer.response.Document;


public class ApiReferenceDaoTest {

    @Test
    public void shouldReturnPostalCodeFromShippingguide() throws JAXBException {
        ApiReferenceDao dao = new ApiReferenceDao();
        Document document = dao.query("shippingguide");
        String title = document.getParameter().get(0).getTitle();
        assertEquals("Postal code", title);
        System.out.println(document.getParameter().get(0).getExample().get(1).getContent());
    } 
    
}
