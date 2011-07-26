package com.bring.developer.dao;

import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.util.List;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

import com.bring.developer.response.pack.Pack;
import com.bring.developer.response.pack.PackagesCategory;

public class XmlDaoPackagesOverivewTest {

	XmlDao<PackagesCategory> dao;
	PackagesCategory packagesType;
	
	@Before
	public void setUp() throws JAXBException {
		dao = XmlDao.createDao(PackagesCategory.class);
		packagesType = dao.query("packagestype");
	}
	
	@Test
	public void shouldGetPackagesOverviewType() {
		assertEquals("widget", packagesType.getType());
	}
	
	@Test
	public void shouldGetPackagesOverviewTitle() {
		assertEquals("Widgets", packagesType.getTitle());
	}
	
	@Test
	public void shouldGetPackageOverviewDescription() {
		assertNotNull(packagesType.getDescription());
	}
	
	@Test
	public void shouldGetAllAndOnlyThe3WidgetsInSubdaos() throws MalformedURLException, FileNotFoundException, JAXBException {
		List<Pack> widgetsList = XmlDao.createDaos(Pack.class, "subdaos");
		
		assertEquals(3, widgetsList.size());
		
		// widget 1 has title 
		assertEquals("I am a widget", widgetsList.get(0).getTitle());
		
		assertEquals("Widget title 2", widgetsList.get(1).getTitle());
		
		assertEquals("Widget title 3", widgetsList.get(2).getTitle());
	}
}
