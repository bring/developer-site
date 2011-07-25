package com.bring.developer.dao;

import static org.junit.Assert.*;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.response.pack.Pack;


public class XmlDaoPackTest {

	private XmlDao<Pack> dao;
	private Pack widget;
	
	@Before
	public void setUp() throws JAXBException {
		dao = new XmlDao<Pack>(Pack.class);
		widget = dao.query("widget");
	}
	
	@Test
	public void shouldGetPackageXml() {
		assertEquals(Pack.class, widget.getClass());
	}
	
	@Test
	public void shouldGetPackageTitle() {
		assertEquals("Widget title", widget.getTitle());
	}
	
	@Test
	public void shouldGetPackageDescription() {
		assertEquals("Description content", widget.getDescription());
	}
	
	@Test
	public void shouldGetPreviewCode() {
		assertEquals("Some code", widget.getPreviewCode());
	}
	
	@Test
	public void shouldGetRepository() throws MalformedURLException {
		assertNotNull(widget.getRepository());
		assertEquals(new URL("http://example.com/repo").toString(), widget.getRepository().toString());
	}
	
	@Test
	public void shouldGetListOfSteps() {
		List<String> steps = widget.getInstallSteps().getSteps();
		assertEquals(3, steps.size());
		
		// Steps
		assertEquals("First step", steps.get(0));
		assertEquals("Second step", steps.get(1));
		assertEquals("Third step", steps.get(2));
	}
}
