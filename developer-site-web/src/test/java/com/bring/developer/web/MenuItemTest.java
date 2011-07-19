package com.bring.developer.web;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class MenuItemTest {
	MenuItem menuItem;
	
	@Before
	public void setUp() {
		menuItem = new MenuItem("menu item");
	}

	@Test
	public void shouldBeAbleToAddChild() {
		MenuItem child = new MenuItem("Child", "child.html");
		MenuItem menuItem = new MenuItem("Menu item");
		menuItem.addChild(child);
		assertEquals(menuItem.getChild(0), child);
	}
	
	@Test
	public void shouldBeAbleToGenerateHtmlWithoutChildren() {
		String expected = "<li><a class=\"menubutton\" href=\"#\">menu item</a></li>";
		assertEquals(expected, menuItem.toHtml());
	}
	
	@Test
	public void shouldBeAbleToMarkMenuItemAsBreadcrumb() {
		String expected = "<li class=\"breadcrumb\"><a class=\"menubutton\" href=\"#\">menu item</a></li>";
		menuItem.setBreadcrumb(true);
		assertEquals(expected, menuItem.toHtml());
	}
	
	@Test
	public void shouldGenerateHtmlWithUrl() {
       String expected = "<li><a class=\"menubutton\" href=\"/home.html\">menu item</a></li>";
       menuItem.setUrl("/home.html");
       assertEquals(expected, menuItem.toHtml());
	}
	
	@Test
	public void shouldGenerateHtmlWithOneChild() {
	    fail("Not implemented");
	}
}