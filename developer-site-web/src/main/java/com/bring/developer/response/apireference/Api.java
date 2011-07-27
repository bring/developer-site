package com.bring.developer.response.apireference;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "Api")
public class Api {
    
    private List<Parameter> parameters = new ArrayList<Parameter>();
    private List<RequestBase> requestBases;

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
    public List<RequestBase> getRequestBases() {
        return requestBases;
    }

    public void setRequestBases(List<RequestBase> requestBases) {
        this.requestBases = requestBases;
    }
    
    public RequestBase getRequestBase(String type) {
        for (RequestBase requestBase: requestBases) {
            if (requestBase.getType().equals(type)) {
                return requestBase;
            }
        }
        return null;
    }

    public RequestBase getExternalRequestBase() {
        return getRequestBase("external");
    }

    public RequestBase getInternalRequestBase() {
        return getRequestBase("internal");
    }
}