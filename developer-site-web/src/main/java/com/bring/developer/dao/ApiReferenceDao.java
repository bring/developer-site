package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBException;

import com.bring.developer.response.Document;

public class ApiReferenceDao {
        
    public Document query(String api) throws JAXBException{
        return query(getClass().getResourceAsStream(api + ".xml"));
    }
    
    public Document query(InputStream inputStream) throws JAXBException{
        System.out.println(inputStream);
        return new XmlParser().unmarshal(inputStream);
    }
}
