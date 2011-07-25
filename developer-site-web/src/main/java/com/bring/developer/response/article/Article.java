package com.bring.developer.response.article;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

@XmlRootElement(name = "Article")
public class Article {
    private String title;
    private String menuTitle;
    private String content;
    
    @XmlElement(name = "Title")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
    @XmlElement(name = "MenuTitle")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getMenuTitle() {
        return menuTitle;
    }
    public void setMenuTitle(String menuTitle) {
        this.menuTitle = menuTitle;
    }
    
    @XmlElement(name = "Content")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
