package com.bring.developer.dao;

import static org.junit.Assert.assertEquals;

import javax.xml.bind.JAXBException;

import org.junit.Test;

import com.bring.developer.response.Products;

public class ProductListDaoTest {
    @Test
    public void shouldReturnPostalCodeFromShippingguide() throws JAXBException {
        ProductListDao dao = new ProductListDao();
        Products products = dao.query("shippingguide-products");
        String title = products.getProduct(0).getCode().getValue();
        System.out.println(title);
    }
}
