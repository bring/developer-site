package com.bring.developer.response.pack;

import java.net.URL;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;
import com.bring.developer.dao.XmlNormalizeURL;

@XmlRootElement(name = "Pack")
public class Pack {
	private String title;
	private String description;
	private Code previewCode;
	private URL repository;
	private Install installSteps;
	
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
	
	@XmlElement(name = "PreviewCode")
	public Code getPreviewCode() {
		return previewCode;
	}
	public void setPreviewCode(Code previewCode) {
		this.previewCode = previewCode;
	}
	
	
	@XmlElement(name = "Repository")
	@XmlJavaTypeAdapter(XmlNormalizeURL.class)
	public void setRepository(URL repository) {
		this.repository = repository;
	}
	
	public URL getRepository() {
		return repository;
	}
	
	@XmlElement(name = "Install")
	public Install getInstallSteps() {
		return installSteps;
	}
	public void setInstallSteps(Install installSteps) {
		this.installSteps = installSteps;
	}
	
}
