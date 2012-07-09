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

import java.util.List;

@Controller
public class HomeController {

    @RequestMapping(value = "/index.html")
    public String index() {
        return "home_v3";
    }

    @RequestMapping(value = "/api/pickuppointapi.html")
    public String pickuppointapi() {
        return "api/pickuppointapi";
    }

    @RequestMapping(value = "/additionalresources/priceadjustments.html")
    public String priceadjustments() {
        return "/additionalresources/priceadjustments";
    }

    @RequestMapping(value = "/additionalresources/wsdl-xml-schema.html")
    public String wsdlschema() {
        return "/additionalresources/wsdl-xml-schema";
    }

    @RequestMapping(value = "/additionalresources/errorhandling.html")
    public String errorhandling() {
        return "/additionalresources/errorhandling";
    }

    @RequestMapping(value = "/api/shippingguideapi.html")
    public String shippingguideapi() {
        return "api/shippingguideapi";
    }

    @RequestMapping(value = "/api/reportsapi.html")
    public String reportsapi() {
        return "api/reportsapi";
    }

    @RequestMapping(value = "/additionalresources/xmlSchemaDefinition.html")
    public String xmlSchemaDefinition() {
        return "additionalresources/xmlSchemaDefinition";
    }

    @RequestMapping(value = "/api/trackingapi.html")
    public String trackingapi() {
        return "api/trackingapi";
    }

    @RequestMapping(value = "/support.html")
    public String support() {
        return "support";
    }

    @RequestMapping(value = "/use/{type}/index.html")
    public String useOverview(ModelMap model, @PathVariable String type) {
        PackagesCategory packagesCategory = XmlDao.createDao(PackagesCategory.class).query("use/" + type);
        List<Pack> packs = XmlDao.createDaos(Pack.class, "use/" + type);
        model.put("overview", packagesCategory);
        model.put("packages", packs);
        return "use/overview";
    }

    @RequestMapping(value = "/widget/choose-pickup-point.html")
    public String choosePickupPoint(){
        return "widget/choosepickuppoint";
    }

    @RequestMapping(value =  "/widget/choose-pickup-point-with-map.html")
    public String choosePickupPointWithMap(){
        return "widget/choosepickuppointwithmap";
    }

    @RequestMapping(value = "/use/{type}/{packageName}.html")
    public String usePackagePage(ModelMap model, @PathVariable String type, @PathVariable String packageName) {
        Pack pack = XmlDao.createDao(Pack.class).query("use/" + type + "/" + packageName);
        model.put("pack", pack);
        model.put("type", type);
        return "use/package";
    }

    @RequestMapping(value = "/use/widget/{widget}/preview.html")
    public String widgetPreview(ModelMap model, @PathVariable String widget) {
        Pack pack = XmlDao.createDao(Pack.class).query("use/widget/" + widget);
        model.put("widget", pack);
        return "use/widgetpreview";
    }

    @RequestMapping(value = "/learn/{api}/apireference.html")
    public String apiReference(ModelMap model, @PathVariable String api) {
        model.put("title", "API Reference");
        return apiReferenceHelper(model, api, "apireference");
    }

    @RequestMapping(value = "/learn/{api}/examples.html")
    public String examples(ModelMap model, @PathVariable String api) {
        model.put("title", "Examples");
        return apiReferenceHelper(model, api, "examples");
    }

    @RequestMapping(value = "/learn/{api}/documentation/apireference.html")
    public String apiReferenceUsage(ModelMap model, @PathVariable String api) {
        model.put("title", "API Reference");
        return apiReferenceHelper(model, api, "documentation/apireference");
    }

    @RequestMapping(value = "/learn/{api}/documentation/parametersindetail.html")
    public String apiReferenceExamples(ModelMap model, @PathVariable String api) {
        model.put("title", "API Reference - Examples");
        return apiReferenceHelper(model, api, "documentation/parametersindetail");
    }

    private String apiReferenceHelper(ModelMap model, String api, String suffix) {
        Api apiDoc = XmlDao.createDao(Api.class).query("learn/" + api + "/" + suffix);
        model.put("apiReference", apiDoc);
        return "learn/apireference";
    }


    @RequestMapping(value = "/learn/{api}/information/product-list.html")
    public String productList(ModelMap model, @PathVariable String api) {
        Products products = XmlDao.createDao(Products.class).query("learn/"+api+"/information/product-list");
        model.put("productList", products);
        model.put("todayString", new DateTime().toString("yyyy-MM-dd"));
        return "learn/product-list";
    }

    @RequestMapping(value = "/learn/{section}.html")
    public String article(ModelMap model, @PathVariable String section) {
        handleArticleRequest(model, section);
        return "learn/article";
    }

    @RequestMapping(value = "/learn/{section}/{subsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection) {
        handleArticleRequest(model, section + "/" + subsection);
        return "learn/article";
    }

    @RequestMapping(value = "/learn/{section}/{subsection}/{subsubsection}.html")
    public String article(ModelMap model, @PathVariable String section, @PathVariable String subsection, @PathVariable String subsubsection) {
        handleArticleRequest(model, section + "/" + subsection + "/" + subsubsection);
        return "learn/article";
    }

    @RequestMapping(value = "/abc/test.fff")
    public String foobar() {
        return "learn/article";
    }

    private void handleArticleRequest(ModelMap model, String section) {
        Article article = XmlDao.createDao(Article.class).query("learn/"+section);
        model.put("article", article);
        model.put("articlePath", section+".jsp");
        model.put("title", "Learn");
    }
}