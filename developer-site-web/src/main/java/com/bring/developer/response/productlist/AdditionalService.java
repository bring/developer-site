package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;

public class AdditionalService {
    
    @XmlAttribute(name = "Name")
    private Name name;

    @XmlAttribute(name = "Code")
    private Code code;

    public Name getName() {
        return name;
    }
    public Code getCode() {
        return code;
    }
}
