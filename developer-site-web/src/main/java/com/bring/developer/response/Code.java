package com.bring.developer.response;

import javax.xml.bind.annotation.XmlValue;

public class Code {
    private String value;
    
    @XmlValue
    public String getValue(){
        return value;
    }
    
    public void setValue(String value) {
        this.value = value.trim();
    }
}
