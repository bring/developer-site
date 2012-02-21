package com.bring.developer.dao;

import com.bring.developer.response.article.Article;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class XmlDaoArticleTest {
    private XmlDao<Article> dao;
    
    @Before
    public void setUp() {
        dao = XmlDao.createDao(Article.class);
    }
    
    @Test
    public void shouldGetArticleXml() throws Exception {
       assertEquals(Article.class, dao.query("article").getClass()); 
    }
    
    @Test
    public void shouldGetTitleFromArticleXml() throws Exception {
       assertEquals("The foo", dao.query("article").getIngress());
    }
    
    @Test
    public void shouldGetMenuTitleFromArticleXml() throws Exception {
        assertEquals("The bar", dao.query("article").getMenuTitle()); 
    }
    
    @Test
    public void shouldGetTrimmedContentTitleFromArticleXml() throws Exception {
        assertEquals("<p>Bar</p>", dao.query("article").getContent()); 
    }
}
