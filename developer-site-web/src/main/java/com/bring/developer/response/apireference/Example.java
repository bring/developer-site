package com.bring.developer.response.apireference;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

public class Example {
    private String type;
    private String title;
    private String content;
    private String request;
    
    @XmlAttribute(name = "type", required = true)
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    @XmlElement(name = "Title", required = true)
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    @XmlElement(name = "Content")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    @XmlElement(name = "Request")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getRequest() {
        return request;
    }
    
    public void setRequest(String request) {
        this.request = request;
    }

}