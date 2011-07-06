package com.bring.developer.web;

import static junit.framework.Assert.assertEquals;
import static org.mockito.Mockito.doReturn;
import com.bring.developer.HelloWorldService;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.ExtendedModelMap;

public class HelloWorldControllerTest {

	private HelloWorldController controller;
	
	private ExtendedModelMap model;

	@Mock
	private HelloWorldService helloWorldServiceMock;

	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		
		model = new ExtendedModelMap();
		
		controller = new HelloWorldController(helloWorldServiceMock);
	}
	
	@Test
	public void shouldSendHelloWorldMessageToProcessing() {
		String name = "Firstname Lastname";
		String expectedResponse = "Hello " + name;
		
		doReturn(expectedResponse).when(helloWorldServiceMock).getMessageForName(name);
		
		String view = controller.helloWorld(name, model);
		
		assertEquals("helloWorld", view);
		assertEquals(expectedResponse, model.get("message"));
	}
	
	@Test
	public void shouldEchoName() {
		String name = "Firstname Lastname";
		
		controller.helloWorld(name, model);
		
		assertEquals(name, model.get("name"));
	}

}