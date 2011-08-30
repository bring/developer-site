package com.bring.developer.web;

import com.bring.developer.dao.XmlDao;
import com.bring.developer.response.apireference.Api;
import com.bring.developer.response.article.Article;
import com.bring.developer.response.pack.Pack;
import com.bring.developer.response.pack.PackagesCategory;
import com.bring.developer.response.productlist.Products;
import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.xml.bind.JAXBException;
import java.util.List;

@Controller
public class HomeController {
    
    @RequestMapping(value = "/index.html")
    public String index() {
        return "home";
    }
    
    @RequestMapping(value = "/use/{type}/index.html")
    public String useOverview(ModelMap model, @PathVariable String type) throws JAXBException {
    	PackagesCategory packagesCategory = XmlDao.createDao(PackagesCategory.class).query("use/" + type);
    	List<Pack> packs = XmlDao.createDaos(Pack.class, "use/" + type);
    	model.put("overview", packagesCategory);
    	model.put("packages", packs);
    	return "use/overview";
    }
    
    @RequestMapping(value = "/use/{type}/{packageName}.html")
    public String usePackagePage(ModelMap model, @PathVariable String type, @PathVariable String packageName) throws JAXBException {
    	Pack pack = XmlDao.createDao(Pack.class).query("use/" + type + "/" + packageName);
    	model.put("pack", pack);
    	model.put("type", type);
    	return "use/package";
    }
    
    @RequestMapping(value = "/use/widget/{widget}/preview.html")
    public String widgetPreview(ModelMap model, @PathVariable String widget) throws JAXBException {
    	Pack pack = XmlDao.createDao(Pack.class).query("use/widget/" + widget);
    	model.put("widget", pack);
    	return "use/widgetpreview";
    }
    
    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) throws JAXBException {
        model.put("title", "API Reference");
        return apiReferenceHelper(model, api, "apireference");
    }
    
    @RequestMapping(value = "/learn/{api}/examples.html")
    public String examples(ModelMap model, @PathVariable String api) throws JAXBException {
        model.put("title", "Examples");
        return apiReferenceHelper(model, api, "examples");
    }

    @RequestMapping(value = "/learn/{api}/documentation/apireference.html")
    public String apiReferenceUsage(ModelMap model, @PathVariable String api) throws JAXBException {
        model.put("title", "API Reference");
        return apiReferenceHelper(model, api, "documentation/apireference");
    }
    
    private String apiReferenceHelper(ModelMap model, String api, String suffix) throws JAXBException {
        Api apiDoc = XmlDao.createDao(Api.class).query("learn/" + api + "/" + suffix);
        model.put("apiReference", apiDoc);
        return "learn/apireference";     
    }
    
    
    @RequestMapping(value = "/learn/{api}/information/product-list.html")
    public String productList(ModelMap model, @PathVariable String api) throws JAXBException {
        Products products = XmlDao.createDao(Products.class).query("learn/"+api+"/information/product-list");
        model.put("productList", products);
        model.put("todayString", new DateTime().toString("yyyy-MM-dd"));
        return "learn/product-list";
    }
    
    @RequestMapping(value = "/learn/{section}.html")
    public String article(ModelMap model, @PathVariable String section) throws JAXBException {
        handleArticleRequest(model, section);
        return "learn/article";
    }
    
    @RequestMapping(value = "/learn/{section}/{subsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection) throws JAXBException {
        handleArticleRequest(model, section + "/" + subsection);
        return "learn/article";
    }
    
    @RequestMapping(value = "/learn/{section}/{subsection}/{subsubsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection, @PathVariable String subsubsection) throws JAXBException {
        handleArticleRequest(model, section + "/" + subsection + "/" + subsubsection);
        return "learn/article";
    }
    
    @RequestMapping(value = "/abc/test.fff")
    public String foobar() {
        return "learn/article";
    }
    
    private void handleArticleRequest(ModelMap model, String section) throws JAXBException {
        Article article = XmlDao.createDao(Article.class).query("learn/"+section);
        model.put("article", article);
        model.put("articlePath", section+".jsp");
        model.put("title", "Learn");
    }
}