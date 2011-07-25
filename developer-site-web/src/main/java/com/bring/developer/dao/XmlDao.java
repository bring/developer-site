package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBException;

public class XmlDao<T> {
        
    private XmlParser<T> xmlParser;
    
    public XmlDao(Class<T> typeParameterClass) {
        this.xmlParser = new XmlParser<T>(typeParameterClass);
    }
    
    public T query(String api) throws JAXBException{
        return query(getClass().getResourceAsStream(api + ".xml"));
    }
    
    public T query(InputStream inputStream) throws JAXBException{
        return xmlParser.unmarshal(inputStream);
    }
}