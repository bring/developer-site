package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;

public class Parameter {
    
    @XmlElement(name = "Title")
    private String title;
    @XmlElement(name = "Description")
    private String description;
    @XmlElement(name = "Example")
    private List<Example> example1 = new ArrayList<Example>();
    @XmlElement(name = "Default")
    private String defaultValue;

    public String getTitle() {
        return title.trim();
    }
    
    public String getDescription() {
        return description.trim();
    }
    
    public List<Example> getExamples() {
        return example1;
    }

    public Example getExample(int i) {
        return example1.get(i);
    }

    public String getDefaultValue() {
        return defaultValue;
    }
}
