package com.bring.developer.response.pack;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

@XmlRootElement(name = "Install")
public class Install {
	private List<String> steps;

	public List<String> getSteps() {
		return steps;
	}
	
	@XmlElement(name = "Step")
	@XmlJavaTypeAdapter(XmlNormalizeString.class)
	public void setSteps(List<String> steps) {
		this.steps = steps;
	}
}
