package com.bring.developer.dao;

import static org.junit.Assert.*;

import javax.xml.bind.JAXBException;

import org.junit.Before;
import org.junit.Test;

import com.bring.developer.response.article.Article;

public class XmlDaoArticleTest {
    private XmlDao<Article> dao;
    
    @Before
    public void setUp() {
        dao = XmlDao.createDao(Article.class);
    }
    
    @Test
    public void shouldGetArticleXml() throws JAXBException {
       assertEquals(Article.class, dao.query("article").getClass()); 
    }
    
    @Test
    public void shouldGetTitleFromArticleXml() throws JAXBException {
       assertEquals("The foo", dao.query("article").getIngress());
    }
    
    @Test
    public void shouldGetMenuTitleFromArticleXml() throws JAXBException {
        assertEquals("The bar", dao.query("article").getMenuTitle()); 
    }
    
    @Test
    public void shouldGetTrimmedContentTitleFromArticleXml() throws JAXBException {
        assertEquals("<p>Bar</p>", dao.query("article").getContent()); 
    }
}
