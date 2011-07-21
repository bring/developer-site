package com.bring.developer.web;

import javax.xml.bind.JAXBException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bring.developer.dao.ApiReferenceDao;
import com.bring.developer.response.Document;

@Controller
public class HomeController {
    ApiReferenceDao dao = new ApiReferenceDao();
    
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
    

    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) throws JAXBException {
        Document document = dao.query(api);
        model.put("document", document);
        return "learn/apireference";
    }
    
    @RequestMapping(value = "/learn/{section}.html")
    public String article(ModelMap model, @PathVariable String section) {
        createIncludePath(model, section);
        return "learn/article";
    }
    @RequestMapping(value = "/learn/{section}/{subsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection) {
        createIncludePath(model, section + "/" + subsection);
        return "learn/article";
    }
    
    @RequestMapping(value = "/learn/{section}/{subsection}/{subsubsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection, @PathVariable String subsubsection) {
        createIncludePath(model, section + "/" + subsection + "/" + subsubsection);
        return "learn/article";
    }
    
    private void createIncludePath(ModelMap model, String section) {
        String[] sectionAr = section.split("/");
        model.put("section", (sectionAr.length < 1 || sectionAr[0].isEmpty()) ? "Learn" : sectionAr[0]);
        model.put("subsection", (sectionAr.length < 2) ? null : sectionAr[1]);
        model.put("subsubsection", (sectionAr.length < 3) ? null : sectionAr[2]);
        model.put("articlePath", section+".jsp");
    }
}