package com.bring.developer.response.productlist;

import com.bring.developer.dao.XmlNormalizeString;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

public class AdditionalService {
    
	private String name;
	private String code;
    private String codeLink;

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

    @XmlElement(name = "CodeLink")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCodeLink() {
		return codeLink;
	}
	public void setCodeLink(String codeLink) {
		this.codeLink = codeLink;
	}

	
}
