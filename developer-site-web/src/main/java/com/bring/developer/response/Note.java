package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;

public class Note {
    private String value;
    @XmlAttribute(name = "note")
    private String note;

    public String getNote() {
        return note;
    }
    
    @XmlValue
    public String getValue(){
        return value;
    }
    
    public void setValue(String value) {
        this.value = value.trim();
    }}
