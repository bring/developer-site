package com.bring.developer.dao;

import javax.xml.bind.JAXBException;

import org.junit.Test;

import com.bring.developer.response.Products;

public class XmlDaoProductListTest {
    @Test
    public void shouldReturnPostalCodeFromShippingguide() throws JAXBException {
        XmlDao<Products> dao = new XmlDao<Products>(Products.class);
        Products products = dao.query("shippingguide-products");
        String title = products.getProduct(0).getCode().getValue();
        System.out.println(title);
    }
}
