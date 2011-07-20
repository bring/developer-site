package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "Document")
public class Document {
    
    @XmlElement(name = "Parameter")
    private List<Parameter> parameters = new ArrayList<Parameter>();
    private String requestBase;

    public List<Parameter> getParameters() {
        return parameters;
    }

    public Parameter getParameter(int i) {
        return parameters.get(i);
    }

    @XmlElement(name ="RequestBase")
    public String getRequestBase() {
        return requestBase;
    }

    public void setRequestBase(String requestBase) {
        this.requestBase = requestBase.trim();
    }
}