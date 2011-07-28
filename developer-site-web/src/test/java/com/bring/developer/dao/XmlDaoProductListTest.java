package com.bring.developer.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.response.productlist.Product;
import com.bring.developer.response.productlist.Products;

public class XmlDaoProductListTest {
    
	private XmlDao<Products> dao;
	private List<Product> products;
	
	@Before
	public void setUp() throws JAXBException {
		dao = new XmlDao<Products>(Products.class);
		products = dao.query("productlist").getProducts();
	}
	
	@Test
    public void shouldGetProducts() {
    	assertEquals(Product.class, products.get(0).getClass());
    }
	
    @Test
    public void shouldGetFirstProductName() {
        assertEquals("Klimanøytral Servicepakke", products.get(0).getName());
    }
    
    @Test
    public void shouldGetFirstProductPrice() {
        assertTrue(products.get(0).getPrice());
    }
}
