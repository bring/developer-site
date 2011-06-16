package com.bring.developer;

import static junit.framework.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

public class HelloWorldServiceTest {

	private HelloWorldService service;
	
	@Before
	public void setUp() {
		service = new HelloWorldService();
	}

	@Test
	public void shouldPrependHelloToName() {
		String name = "Petter Pan";
		String expectedMessage = "Hello Petter Pan";
		
		String message = service.getMessageForName(name);
		
		assertEquals(expectedMessage, message);
	}
	
}
