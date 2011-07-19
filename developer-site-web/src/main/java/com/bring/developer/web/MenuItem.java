package com.bring.developer.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MenuItem implements Iterable<MenuItem> {
    private String name;
    private String url;
    private boolean breadcrumb;
    List<MenuItem> children;

    public MenuItem(String name, String url) {
        this.setName(name);
        this.setUrl(url);
        this.children = new ArrayList<MenuItem>();
    }

    public MenuItem(String name) {
        this(name, "#");
    }

    public void addChild(MenuItem child) {
        children.add(child);
    }

    public MenuItem getChild(int i) {
        return children.get(i);
    }

    @Override
    public Iterator<MenuItem> iterator() {
        return children.iterator();
    }

    public String toHtml() {
        String prefix;
        if (breadcrumb) {
            prefix = "<li class=\"breadcrumb\">";
        }
        else {
            prefix = "<li>";
        }
        
        return prefix + "<a class=\"menubutton\" href=\"" + getUrl() + "\">" + getName() + "</a></li>";
    }

    public boolean isBreadcrumb() {
        return breadcrumb;
    }

    public void setBreadcrumb(boolean breadcrumb) {
        this.breadcrumb = breadcrumb;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}