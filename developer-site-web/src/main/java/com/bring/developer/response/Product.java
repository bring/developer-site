package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;

public class Product {
    
    @XmlAttribute(name = "note")
    private String note;
    
    @XmlAttribute(name = "Name")
    private Name name;

    @XmlAttribute(name = "Code")
    private Code code;

    @XmlAttribute(name = "Price")
    private Price price;
    
    @XmlAttribute(name = "ExpectedDelivery")
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
