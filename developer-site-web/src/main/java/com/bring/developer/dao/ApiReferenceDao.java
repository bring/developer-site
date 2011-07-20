package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBException;

import com.bring.developer.response.Document;

public class ApiReferenceDao {
        
    private XmlParser<Document> xmlParser;
    
    public ApiReferenceDao(){
        this.xmlParser = new XmlParser<Document>(Document.class);
    }
    
    public Document query(String api) throws JAXBException{
        return query(getClass().getResourceAsStream(api + ".xml"));
    }
    
    public Document query(InputStream inputStream) throws JAXBException{
        return xmlParser.unmarshal(inputStream);
    }
}
