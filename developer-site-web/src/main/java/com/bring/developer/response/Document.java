package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "Document")
public class Document {
    
    private List<Parameter> parameters = new ArrayList<Parameter>();
    private String requestBase;

    @XmlElement(name = "Parameter")
    public List<Parameter> getParameters() {
        return parameters;
    }
    
    public void setParameters(List<Parameter> parameters) {
        this.parameters = parameters;
    }

    public Parameter getParameter(int i) {
        return getParameters().get(i);
    }
    
    public Parameter getFirstParameter() {
        return parameters.get(0);
    }

    @XmlElement(name ="RequestBase")
    public String getRequestBase() {
        return requestBase;
    }

    public void setRequestBase(String requestBase) {
        this.requestBase = requestBase.trim();
    }
}