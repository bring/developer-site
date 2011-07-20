package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class Example {
    private String type;
    private String title;
    private String content;
    private String request;
    
    @XmlAttribute(name = "type", required = true)
    public String getType() {
        return type.trim();
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    @XmlElement(name = "Title")
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title.trim();
    }
    
    @XmlElement(name = "Content")
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content.trim();
    }
    
    @XmlElement(name = "Request")
    public String getRequest() {
        return request;
    }
    
    public void setRequest(String request) {
        this.request = request.trim();
    }

}
