package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class Product {
    
    @XmlAttribute(name = "note")
    private String note;
    
    @XmlElement(name = "Name")
    private Name name;

    @XmlElement(name = "Code")
    private Code code;

    @XmlElement(name = "Price")
    private Price price;
    
    @XmlElement(name = "ExpectedDelivery")
    private ExpectedDelivery expectedDelivery;
    
    public Name getName() {
        return name;
    }
    public Code getCode() {
        return code;
    }
    public Price getPrice() {
        return price;
    }

    public ExpectedDelivery getExpectedDelivery() {
        return expectedDelivery;
    }
    
    public String getNote() {
        return note;
    }
    
}
