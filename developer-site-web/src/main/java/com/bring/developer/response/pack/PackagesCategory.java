package com.bring.developer.response.pack;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

@XmlRootElement(name = "PackagesOverview")
public class PackagesCategory {

	private String title;
	private String description;
	private String type;
	
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
	
	@XmlAttribute(name = "type")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
