package com.bring.developer.response;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import com.bring.developer.dao.XmlNormalizeString;

public class Media {

	private String file;
	private String role;
	private String caption;
	
	@XmlElement(name = "File")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	@XmlAttribute(name = "role")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@XmlElement(name = "Caption")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
}
