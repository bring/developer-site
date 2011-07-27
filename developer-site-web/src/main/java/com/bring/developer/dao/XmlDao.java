package com.bring.developer.dao;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

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
    
    public static <T> XmlDao<T> createDao(Class<T> type) {
    	return new XmlDao<T>(type);
    }
    
    public static <T> List<T> createDaos(Class<T> types, String daosDir) throws JAXBException {
    	InputStream matches = XmlDao.class.getResourceAsStream(daosDir + "/.");
    	Scanner scanner = new Scanner(matches);
    	
    	List<T> typesList = new ArrayList<T>();
    	
    	while(scanner.hasNextLine()) {
    		String file = scanner.nextLine();
    		if(file.endsWith(".xml")) {
    			file = file.substring(0, file.length() - ".xml".length());
    			typesList.add(XmlDao.createDao(types).query(daosDir + "/" + file));
    		}
    	}
    	
    	return typesList;
    }
}