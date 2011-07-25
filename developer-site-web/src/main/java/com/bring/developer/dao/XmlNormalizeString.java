package com.bring.developer.dao;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class XmlNormalizeString extends XmlAdapter<String, String> {

	@Override
	public String marshal(String arg0) throws Exception {
		return arg0.trim();
	}

	@Override
	public String unmarshal(String arg0) throws Exception {
		return arg0.trim();
	}

}
