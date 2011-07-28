package com.bring.developer.dao;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class XmlNormalizeBoolean extends XmlAdapter<String, Boolean> {

	@Override
	public String marshal(Boolean arg0) throws Exception {
		return (arg0) ? "1" : "0";
	}

	@Override
	public Boolean unmarshal(String arg0) throws Exception {
	    return arg0.trim().equals("1");
	}

}
