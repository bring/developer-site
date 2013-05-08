package com.bring.developer.dao;

import org.apache.commons.io.IOUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;
import java.io.InputStream;

import static com.bring.developer.config.ApplicationConfig.FRAKTGUIDE_URL_FOR_ENVIRONMENT;
import static org.apache.commons.io.IOUtils.toInputStream;
import static org.springframework.util.StringUtils.replace;

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
            throw new RuntimeException(e);
        }
    }

    public T unmarshal(InputStream inputStream) {
        try {

            Unmarshaller unmarshaller = context.createUnmarshaller();

            InputStream filteredXml = replaceUrlToFraktguideWithCorrectEnvironment(inputStream);

            return (T) unmarshaller.unmarshal(filteredXml);
        } catch (JAXBException e) {
            throw new RuntimeException("Unable to unmarshal XML", e);
        }
    }

    private InputStream replaceUrlToFraktguideWithCorrectEnvironment(InputStream inputStream) {
        if (FRAKTGUIDE_URL_FOR_ENVIRONMENT.equals("https://api.bring.com/shippingguide")) {
            //performance optimization
            return inputStream;
        }

        try {
            String xml = IOUtils.toString(inputStream);
            return toInputStream(replace(xml, "https://api.bring.com/shippingguide", FRAKTGUIDE_URL_FOR_ENVIRONMENT));
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}