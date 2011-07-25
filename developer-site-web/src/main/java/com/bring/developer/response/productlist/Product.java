package com.bring.developer.response.productlist;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeBoolean;
import com.bring.developer.dao.XmlNormalizeString;

public class Product {
	
	private String name;
	private String code;
	private Boolean price;
	private Boolean expectedDelivery;
	private int note;
	
	@XmlAttribute(name = "Name")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@XmlAttribute(name = "Code")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@XmlElement(name = "Price")
	@XmlJavaTypeAdapter(XmlNormalizeBoolean.class)
	public Boolean isPrice() {
		return price;
	}
	public void setPrice(Boolean price) {
		this.price = price;
	}
	
	@XmlElement(name = "ExpectedDelivery")
	@XmlJavaTypeAdapter(XmlNormalizeBoolean.class)
	public Boolean isExpectedDelivery() {
		return expectedDelivery;
	}
	public void setExpectedDelivery(Boolean expectedDelivery) {
		this.expectedDelivery = expectedDelivery;
	}
	
	
	@XmlAttribute(name = "note")
	public int getNote() {
		return note;
	}
	public void setNote(int note) {
		this.note = note;
	}
    
}
