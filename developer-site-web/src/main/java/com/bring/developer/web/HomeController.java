package com.bring.developer.web;

import java.util.List;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.XmlDao;
import com.bring.developer.response.productlist.Products;
import com.bring.developer.response.apireference.Api;
import com.bring.developer.response.article.Article;
import com.bring.developer.response.pack.Pack;
import com.bring.developer.response.pack.PackagesCategory;

@Controller
public class HomeController {
	
    
    @RequestMapping(value = "/home.html")
    public String home() {
        return "home";
    }
    
    @RequestMapping(value = "/index.html")
    public String index() {
    	return home();
    }
    
    @RequestMapping(value = "/talk.html")
    public String talk() {
        return "talk";
    }
    
    /// Temp
    @RequestMapping(value = "/learn/tracking/index.html")
    public String tracking() {
        return "learn/tracking/index";
    }
    
    //@RequestMapping(value = "/download/widget/index.html")
    public String widget() {
        return "/download/widget/index";
    }
    
    //@RequestMapping(value = "/download/widget/optionalpostoffice.html")
    public String optionalpostoffice() {
        return "/download/widget/optionalpostoffice";
    }
    

    //@RequestMapping(value = "/download/widget/postalcodevalidation.html")
    public String postalcodevalidation() {
        return "/download/widget/postalcodevalidation/index";
    }
    /// End temp
    
    @RequestMapping(value = "/download/{type}/index.html")
    public String downloadOverview(ModelMap model, @PathVariable String type) throws JAXBException {
    	PackagesCategory packagesCategory = XmlDao.createDao(PackagesCategory.class).query("download/" + type);
    	List<Pack> packs = XmlDao.createDaos(Pack.class, "download/" + type);
    	System.out.println(packs.size());
    	model.put("overview", packagesCategory);
    	model.put("packages", packs);
    	
    	return "download/overview";
    }
    
    @RequestMapping(value = "/download/{type}/{packageName}.html")
    public String downloadPackagePage(ModelMap model, @PathVariable String type, @PathVariable String packageName) throws JAXBException {
    	Pack pack = XmlDao.createDao(Pack.class).query("download/" + type + "/" + packageName);
    	model.put("pack", pack);
    	model.put("type", type);
    	return "download/package";
    }
    
    @RequestMapping(value = "/download/widget/{widget}/preview.html")
    public String widgetPreview(ModelMap model, @PathVariable String widget) throws JAXBException {
    	Pack pack = XmlDao.createDao(Pack.class).query("download/widget/" + widget);
    	model.put("widget", pack);
    	return "download/widgetpreview";
    }
    
    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) throws JAXBException {
        return apiReferenceHelper(model, api);
    }
    
    @RequestMapping(value = "/learn/{api}/apireference/usage.html")
    public String apiReferenceUsage(ModelMap model, @PathVariable String api) throws JAXBException {
        return apiReferenceHelper(model, api, "/usage");
    }
    
    private String apiReferenceHelper(ModelMap model, String api, String... suffix) throws JAXBException {
        Api apiDoc = XmlDao.createDao(Api.class).query("learn/"+api+"/apireference"+(suffix.length > 0 ? suffix[0] : ""));
        model.put("apiReference", apiDoc);
        return "learn/apireference";     
    }
    
    
    @RequestMapping(value = "/learn/{api}/apireference/products.html")
    public String productList(ModelMap model, @PathVariable String api) throws JAXBException {
        Products products = XmlDao.createDao(Products.class).query("learn/"+api+"/apireference/products");
        model.put("productList", products);
        return "learn/products";
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