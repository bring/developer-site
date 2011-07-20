package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;

public class Note {
    @XmlAttribute(name = "note")
    private String note;

    @XmlValue
    private String value;
    
    public String getNote() {
        return note;
    }
    
    public String getValue() {
        return value;
    }
}
