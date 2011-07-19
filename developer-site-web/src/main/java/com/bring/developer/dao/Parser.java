package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.bring.developer.response.Document;

public class Parser {
    
    private JAXBContext context;
    
    public Parser(){
        try {
            context = JAXBContext.newInstance(Document.class);
        } catch (JAXBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Document unmarshal(InputStream inputStream) throws JAXBException {
        Unmarshaller unmarshaller = context.createUnmarshaller();
        System.out.println(unmarshaller);
        Document p = (Document) unmarshaller.unmarshal(inputStream);
        return p;

    }
}