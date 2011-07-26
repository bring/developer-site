package com.bring.developer.response.pack;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

public class Code {

	private String content;
	private String highlightLines;
	
	@XmlValue
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@XmlAttribute(name = "highlightLines")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getHighlightLines() {
		return highlightLines;
	}
	public void setHighlightLines(String highlightLines) {
		this.highlightLines = highlightLines;
	}
}
