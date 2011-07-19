package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "Document")
public class Document {
    
    @XmlElement(name = "Parameter")
    private List<Parameter> parameter = new ArrayList<Parameter>();

    public List<Parameter> getParameter() {
        return parameter;
    }
    
}
