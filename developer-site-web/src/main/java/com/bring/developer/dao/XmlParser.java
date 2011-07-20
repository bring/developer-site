package com.bring.developer.dao;

import java.io.InputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

/**
 * Response element parser that uses JAXB.
 * 
 * @param <T>
 *            The type of the input / result object
 */
public class XmlParser<T> {

    private JAXBContext context;

    public XmlParser(Class<T> typeParameterClass) {
        try {
            context = JAXBContext.newInstance(typeParameterClass);
        } catch (JAXBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public T unmarshal(InputStream inputStream) throws JAXBException {
        
        Unmarshaller unmarshaller = context.createUnmarshaller();
        T p = (T) unmarshaller.unmarshal(inputStream);
        return p;
    }
}