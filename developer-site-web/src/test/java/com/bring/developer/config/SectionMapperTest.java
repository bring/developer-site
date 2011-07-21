package com.bring.developer.config;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class SectionMapperTest {
    SectionMapper mapper;
    
    @Before
    public void setUp() {
        mapper = new SectionMapper();
    }
    
    @Test
    public void shouldMapTrackingToTrackingApiBeta() {
        assertArrayEquals(new String[]{"Tracking API beta"}, mapper.getSectionName("tracking"));
    }
    /*
    @Test
    public void shouldMapTrackingToMenuChoice2() {
        assertEquals(2, mapper.getMenuChoice("tracking"));
    }*/
}
