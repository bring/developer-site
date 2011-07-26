package com.bring.developer.dao;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class DownloadDaoTest {
    DownloadDao dao;
    
    @Before
    public void setUp() {
        dao = new DownloadDao();
    }
    
    @Test
    public void shouldReturnMimeTypeXmlForApireferenceXml() {
        assertEquals("application/xml", dao.getMimeType("apireference.xml"));
    }
    
    @Test
    public void shouldBeAbleToWriteApireferenceXmlToStream() {
//        dao.writeFileToStream();
    }
}
