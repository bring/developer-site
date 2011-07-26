package com.bring.developer.web;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.XmlDao;
import com.bring.developer.response.apireference.Api;
import com.bring.developer.response.article.Article;

@Controller
public class HomeController {
    XmlDao<Api> apiReferenceDao = new XmlDao<Api>(Api.class);
    XmlDao<Article> articleDao = new XmlDao<Article>(Article.class);
    
    @RequestMapping(value = "/home.html")
    public String home() {
        return "home";
    }
    
    @RequestMapping(value = "/talk.html")
    public String talk() {
        return "talk";
    }
    
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
    
    @RequestMapping(value = "/download/widget/postalcodevalidation/index.html")
    public String postalcodevalidation() {
        return "/download/widget/postalcodevalidation/index";
    }
    

    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) throws JAXBException {
        Api apiDoc = apiReferenceDao.query("learn/"+api+"/apireference");
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
        Article article = articleDao.query("learn/"+section);
        model.put("article", article);
        model.put("articlePath", section+".jsp");
        model.put("title", "Lern");
    }
}