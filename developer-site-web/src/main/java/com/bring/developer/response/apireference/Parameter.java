package com.bring.developer.response.apireference;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

public class Parameter {
    
    private String title;
    private String description;
    private List<Example> examples = new ArrayList<Example>();
    private String defaultValue;
    
    @XmlElement(name = "Title")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    @XmlElement(name = "Description")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    @XmlElement(name = "Example")
    public List<Example> getExamples() {
        return examples;
    }
    
    public Example getExample(int i) {
        return examples.get(i);
    }
    
    public void setExamples(List<Example> examples) {
        this.examples = examples;
    }
    
    @XmlElement(name = "Default")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getDefault() {
        return defaultValue;
    }
    
    public void setDefault(String defaultValue) {
        this.defaultValue = defaultValue;
    }
    
    
}
