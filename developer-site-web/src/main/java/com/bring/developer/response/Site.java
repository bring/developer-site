package com.bring.developer.response;

import java.net.URL;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;
import com.bring.developer.dao.XmlNormalizeURL;

public class Site {
	private String title;
	private URL url;
	
	@XmlElement(name = "Title")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@XmlElement(name = "Url")
	@XmlJavaTypeAdapter(XmlNormalizeURL.class)
	public URL getUrl() {
		return url;
	}
	public void setUrl(URL url) {
		this.url = url;
	}
}
