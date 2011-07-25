package com.bring.developer.response.productlist;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

public class AdditionalService {
    
	private String name;
	private String code;
	
	@XmlElement(name = "Name")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@XmlElement(name = "Code")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	
}
