package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class Example {
    
    @XmlAttribute(name = "type", required = true)
    private String type;
    @XmlElement(name = "Title")
    private String title;
    @XmlElement(name = "Content")
    private String content;
    @XmlElement(name = "Request")
    private String request;
    
    public String getType() {
        return type.trim();
    }
    public String getTitle() {
        return title.trim();
    }
    
    public String getContent() {
        return content.trim();
    }
    
    public String getRequest() {
        return request.trim();
    }

}
