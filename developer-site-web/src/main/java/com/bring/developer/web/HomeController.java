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

    @RequestMapping(value = "/api/bookingapi.html")
    public String bookingapi() {
        return "api/bookingapi";
    }

    @RequestMapping(value = "/api/postalcodeapi.html")
    public String postalcodeapi() {
        return "api/postalcodeapi";
    }

    @RequestMapping(value = "/additionalresources/priceadjustments.html")
     public String priceadjustments() {
        return "/additionalresources/priceadjustments";
    }

    @RequestMapping(value = "/additionalresources/javaapi.html")
    public String javaapi() {
        return "/additionalresources/javaapi";
    }

    @RequestMapping(value = "/additionalresources/phpapi.html")
    public String phpapi() {
        return "/additionalresources/phpapi";
    }

    @RequestMapping(value = "/additionalresources/offlinedata.html")
    public String offlinedata() {
        return "/additionalresources/offlinedata";
    }

    @RequestMapping(value = "/additionalresources/productlist.html")
    public String productlist() {
        return "/additionalresources/productlist";
    }

    @RequestMapping(value = "/additionalresources/wsdl-xml-schema.html")
    public String wsdlschema() {
        return "/additionalresources/wsdl-xml-schema";
    }

    @RequestMapping(value = "/additionalresources/errorhandling.html")
    public String errorhandling() {
        return "/additionalresources/errorhandling";
    }

    @RequestMapping(value = "/widget/displayshippingguideinformationusingjsonp.html")
    public String displayshippingguideinformationusingjsonp() {
        return "/widget/displayshippingguideinformationusingjsonp";
    }

    @RequestMapping(value = "/api/shippingguideapi.html")
    public String shippingguideapi() {
        return "api/shippingguideapi";
    }

    @RequestMapping(value = "/api/reportsapi.html")
     public String reportsapi() {
        return "api/reportsapi";
    }

    @RequestMapping(value = "/widget/productselectionashtml.html")
    public String productselectionashtml() {
        return "/widget/productselectionashtml";
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
        return "support/support";
    }

    @RequestMapping(value = "/support/getting-api-keys.html")
    public String gettingApiKeys() {
        return "support/getting-api-keys";
    }

    @RequestMapping(value = "/plugin/joomla-virtuemart-fraktpriser.html")
    public String joomlaVirtumartFraktpriser(){
        return "plugin/joomla-virtuemart-fraktpriser";
    }

    @RequestMapping(value = "/plugin/oscommerce-fraktpriser.html")
    public String osCommerceFraktpriser(){
        return "plugin/oscommerce-fraktpriser";
    }

    @RequestMapping(value = "/plugin/prestashop-fraktguide.html")
    public String prestashopFraktguide(){
        return "plugin/prestashop-fraktguide";
    }

    @RequestMapping(value = "/plugin/wordpress-e-commerce-fraktguide.html")
    public String wordpressFraktguide(){
        return "plugin/wordpress-e-commerce-fraktguide";
    }

    @RequestMapping(value = "/plugin/zencart-fraktguide.html")
    public String zencartFraktguide(){
        return "plugin/zencart-fraktguide";
    }

    @RequestMapping(value = "/widget/choose-pickup-point.html")
    public String choosePickupPoint(){
        return "widget/choosepickuppoint";
    }

    @RequestMapping(value =  "/widget/choose-pickup-point-with-map.html")
    public String choosePickupPointWithMap(){
        return "widget/choosepickuppointwithmap";
    }

    @RequestMapping(value =  "/widget/link-to-shipment-tracking.html")
    public String linkToShipmentTracking(){
        return "widget/linktoshipmenttracking";
    }

    @RequestMapping(value = "widget/validate-postal-code.html")
    public String validatePostalCode(){
        return "widget/validatepostalcode";
    }

    @RequestMapping(value = "widget/preview/choose-pickup-point-preview.html")
    public String choosePickupPointPreview(){
        return "widget/preview/choosepickuppoint-preview";
    }

    @RequestMapping(value = "widget/preview/choose-pickup-point-with-map-preview.html")
    public String choosePickupPointWithMapPreview(){
        return "widget/preview/choosepickuppointwithmap-preview";
    }

    @RequestMapping(value = "widget/preview/display-shipping-guide-info-preview.html")
    public String displayShippingGuideInfoPreview(){
        return "widget/preview/displayshippingguideinfo-preview";
    }

    @RequestMapping(value = "widget/preview/product-selection-as-html-preview.html")
    public String productSelectionAsHtmlPreview(){
        return "widget/preview/productselectionashtml-preview";
    }

    @RequestMapping(value = "widget/preview/tracking-link-preview.html")
    public String trackingLinkPreview(){
        return "widget/preview/trackinglink-preview";
    }

    @RequestMapping(value = "widget/preview/validate-postal-code-preview.html")
    public String validatePostalCodePreview(){
        return "widget/preview/validatepostalcode-preview";
    }

}