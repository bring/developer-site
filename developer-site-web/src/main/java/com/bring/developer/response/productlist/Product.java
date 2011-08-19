package com.bring.developer.response.productlist;

import com.bring.developer.dao.XmlNormalizeBoolean;
import com.bring.developer.dao.XmlNormalizeString;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

public class Product {
	
	private String name;
	private String code;
	private Boolean price;
	private Boolean expectedDelivery;
	private int note;
    private String codeLink;
    private String priceLink;
    private String expectedDeliveryLink;

    @XmlElement(name = "Name")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@XmlElement(name = "CodeLink")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCodeLink() {
		return codeLink;
	}
	public void setCodeLink(String codeLink) {
		this.codeLink = codeLink;
	}

    @XmlElement(name = "PriceLink")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getPriceLink() {
		return priceLink;
	}
	public void setPriceLink(String priceLink) {
		this.priceLink = priceLink;
	}

    @XmlElement(name = "ExpectedDeliveryLink")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getExpectedDeliveryLink() {
		return expectedDeliveryLink;
	}
	public void setExpectedDeliveryLink(String expectedDeliveryLink) {
		this.expectedDeliveryLink = expectedDeliveryLink;
	}

    @XmlElement(name = "Code")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@XmlElement(name = "Price")
	@XmlJavaTypeAdapter(XmlNormalizeBoolean.class)
	public Boolean getPrice() {
		return price;
	}
	public void setPrice(Boolean price) {
		this.price = price;
	}
	
	@XmlElement(name = "ExpectedDelivery")
	@XmlJavaTypeAdapter(XmlNormalizeBoolean.class)
	public Boolean getExpectedDelivery() {
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
