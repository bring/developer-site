package com.bring.developer.response.article;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.bring.developer.dao.XmlNormalizeString;

@XmlRootElement(name = "Article")
public class Article {
    private String ingress;
    private String menuTitle;
    private String content;
    
    @XmlElement(name = "Ingress")
    @XmlJavaTypeAdapter(XmlNormalizeString.class)
    public String getIngress() {
        return ingress;
    }
    public void setIngress(String title) {
        this.ingress = title;
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
