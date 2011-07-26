package com.bring.developer.web;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.XmlDao;
import com.bring.developer.response.apireference.Api;
import com.bring.developer.response.article.Article;
import com.bring.developer.response.pack.Pack;

@Controller
public class HomeController {
	
    
    @RequestMapping(value = "/home.html")
    public String home() {
        return "home";
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
    
    @RequestMapping(value = "/download/widget/index.html")
    public String widget() {
        return "/download/widget/index";
    }
    
    @RequestMapping(value = "/download/widget/optionalpostoffice.html")
    public String optionalpostoffice() {
        return "/download/widget/optionalpostoffice";
    }
    

    @RequestMapping(value = "/download/widget/postalcodevalidation.html")
    public String postalcodevalidation() {
        return "/download/widget/postalcodevalidation/index";
    }

    /// End temp
    
    
    @RequestMapping(value = "/download/{type}/{packageName}.html")
    public String downloadPackagePage(ModelMap model, @PathVariable String type, @PathVariable String packageName) throws JAXBException {
    	Pack pack = XmlDao.createDao(Pack.class).query(type + "/" + packageName);
    	model.put("pack", pack);
    	model.put("type", type);
    	return "download/package";
    }

    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) throws JAXBException {
        Api apiDoc = XmlDao.createDao(Api.class).query("learn/"+api+"/apireference");
        model.put("document", apiDoc);
        return "learn/apireference";
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
    
    private void handleArticleRequest(ModelMap model, String section) throws JAXBException {
        Article article = XmlDao.createDao(Article.class).query("learn/"+section);
        model.put("article", article);
        model.put("articlePath", section+".jsp");
        model.put("title", "Lern");
    }
}