package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBException;

import com.bring.developer.response.Products;

public class ProductListDao {
    
    private XmlParser<Products> xmlParser;
    
    public ProductListDao(){
        this.xmlParser = new XmlParser<Products>(Products.class);
    }
    
    public Products query(String api) throws JAXBException{
        return query(getClass().getResourceAsStream(api + ".xml"));
    }
    
    public Products query(InputStream inputStream) throws JAXBException{
        System.out.println(inputStream);
        return xmlParser.unmarshal(inputStream);
    }
}
