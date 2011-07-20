package com.bring.developer.response;

import javax.xml.bind.annotation.XmlValue;

public class Price {
    @XmlValue
    private String value;
    
    public String getValue(){
        return value;
    }
}
