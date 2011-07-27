package com.bring.developer.response;

import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.apache.commons.codec.binary.Hex;

import com.bring.developer.dao.XmlNormalizeString;
import com.bring.developer.dao.XmlNormalizeURL;

public class Person {

	private String role;
	private String name;
	private String company;
	private String email;
	private URL url;
	
	@XmlAttribute(name = "role")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@XmlElement(name = "Name")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@XmlElement(name = "Company")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	@XmlElement(name = "Email")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@XmlElement(name = "Url")
	@XmlJavaTypeAdapter(XmlNormalizeURL.class)
	public URL getUrl() {
		return url;
	}
	public void setUrl(URL url) {
		this.url = url;
	}
	
	
	public String getAvatarUrl() throws NoSuchAlgorithmException {
		String email = getEmail() == null ? "" : getEmail().trim().toLowerCase();
		String hash = Hex.encodeHexString(MessageDigest.getInstance("MD5").digest(email.getBytes()));
		return "http://www.gravatar.com/avatar/" + hash + ".jpg?d=identicon";
	}
}
