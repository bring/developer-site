package com.bring.developer.web;

import com.bring.developer.dao.ProxyDaoImpl;
import org.junit.Before;
import org.junit.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockHttpServletRequest;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ProxyControllerTest {

    private ProxyDaoImpl dao;

    @Before
    public void setUp() throws Exception {
        dao = mock(ProxyDaoImpl.class);
    }

    @Test
    public void should_capture_rest_of_url() throws UnsupportedEncodingException {
        ProxyController controller = new ProxyController(dao);
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setServletPath("/proxy/shipping-guide/test/long/paths");

        when(dao.performRequest("shipping-guide", "test/long/paths", new HashMap<String, String[]>()))
                .thenReturn(new ResponseEntity<byte[]>("Test".getBytes("UTF-8"), HttpStatus.OK));

        ResponseEntity<byte[]> entity = controller.apiRequest(request, "shipping-guide");

        assertEquals("Test", new String(entity.getBody(), "UTF-8"));
    }
}
