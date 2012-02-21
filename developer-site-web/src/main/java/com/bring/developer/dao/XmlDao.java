package com.bring.developer.dao;

import com.bring.developer.config.ApplicationConfig;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class XmlDao<T> {
        
    private XmlParser<T> xmlParser;
    
    public XmlDao(Class<T> typeParameterClass) {
        this.xmlParser = new XmlParser<T>(typeParameterClass);
    }
    
    public static <T> List<T> createDaos(Class<T> types, String daosDir) {
        InputStream matches = XmlDao.class.getResourceAsStream(daosDir + "/.");
        Scanner scanner = new Scanner(matches);

        List<T> typesList = new ArrayList<T>();

        while(scanner.hasNextLine()) {
            String file = scanner.nextLine();
            if(file.endsWith(".xml")) {
                file = file.substring(0, file.length() - ".xml".length());
                XmlDao<T> dao = XmlDao.createDao(types);
                typesList.add(dao.query(daosDir + "/" + file));
            }
        }
        return typesList;
    }

    public T query(String api) {
        InputStream inputStream;

        if (ApplicationConfig.CLASSPATH_XML_FILES) {
            inputStream = getClass().getResourceAsStream(api + ".xml");
        }
        else {
            String filePath =
                    "src/main/resources/" +
                            this.getClass().getPackage().getName().replaceAll("\\.", "/")
                            + "/" + api + ".xml";
            try {
                inputStream = FileUtils.openInputStream(new File(filePath));
            } catch (IOException e) {
                throw new RuntimeException("Unable to get file: " + filePath, e);
            }
        }
        return xmlParser.unmarshal(inputStream);
    }

    public static <T> XmlDao<T> createDao(Class<T> type) {
        return new XmlDao<T>(type);
    }

}
