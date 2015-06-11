package com.bring.developer.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/index.html")
    public String index() {
        return "home_v3";
    }

    @RequestMapping("/support")
    public String support() {
        return "support/support";
    }

    @RequestMapping("/additionalresources/booking-api-error-codes.html")
    public String bookingErrorCodes() {
        return "/additionalresources/booking-error-codes";
    }

    @RequestMapping("/additionalresources/bookingproductlist.html")
    public String bookingProductList() {
        return "/additionalresources/bookingproductlist";
    }

    @RequestMapping("/api/pickuppointapi.html")
     public String pickuppointapi() {
        return "api/pickuppointapi";
    }

    @RequestMapping("/api/bookingapi.html")
    public String bookingapi() {
        return "api/bookingapi";
    }

    @RequestMapping("/api/postalcodeapi.html")
    public String postalcodeapi() {
        return "api/postalcodeapi";
    }

    @RequestMapping("/additionalresources/priceadjustments.html")
     public String priceadjustments() {
        return "/additionalresources/priceadjustments";
    }

    @RequestMapping("/additionalresources/offlinedata.html")
    public String offlinedata() {
        return "/additionalresources/offlinedata";
    }

    @RequestMapping("/additionalresources/productlist.html")
    public String productlist() {
        return "/additionalresources/productlist";
    }

    @RequestMapping("/additionalresources/wsdl-xml-schema.html")
    public String wsdlschema() {
        return "/additionalresources/wsdl-xml-schema";
    }

    @RequestMapping("/additionalresources/errorhandling.html")
    public String errorhandling() {
        return "/additionalresources/errorhandling";
    }

    @RequestMapping("/widget/displayshippingguideinformationusingjsonp.html")
    public String displayshippingguideinformationusingjsonp() {
        return "/widget/displayshippingguideinformationusingjsonp";
    }

    @RequestMapping("/api/shippingguideapi.html")
    public String shippingguideapi() {
        return "api/shippingguideapi";
    }

    @RequestMapping("/api/purchaseorderapi.html")
    public String purchaseorderapi() {
        return "api/purchaseorderapi";
    }

    @RequestMapping("/additionalresources/po-error.html")
    public String po_error() {
        return "/additionalresources/po-error";
    }

    @RequestMapping("/additionalresources/wsdlschema.html")
    public String wsdlschema_po() {
        return "/additionalresources/wsdlschema";
    }

    @RequestMapping("/api/reportsapi.html")
     public String reportsapi() {
        return "api/reportsapi";
    }

    @RequestMapping("/widget/productselectionashtml.html")
    public String productselectionashtml() {
        return "/widget/productselectionashtml";
    }

    @RequestMapping("/additionalresources/xmlSchemaDefinition.html")
    public String xmlSchemaDefinition() {
        return "additionalresources/xmlSchemaDefinition";
    }

    @RequestMapping("/api/trackingapi.html")
    public String trackingapi() {
        return "api/trackingapi";
    }

    @RequestMapping("/additionalresources/getting-api-keys.html")
    public String gettingApiKeys() {
        return "additionalresources/getting-api-keys";
    }

    @RequestMapping("/plugin/joomla-virtuemart-fraktpriser.html")
    public String joomlaVirtumartFraktpriser(){
        return "plugin/joomla-virtuemart-fraktpriser";
    }

    @RequestMapping("/plugin/oscommerce-fraktpriser.html")
    public String osCommerceFraktpriser(){
        return "plugin/oscommerce-fraktpriser";
    }

    @RequestMapping("/plugin/prestashop-fraktguide.html")
    public String prestashopFraktguide(){
        return "plugin/prestashop-fraktguide";
    }

    @RequestMapping("/plugin/wordpress-e-commerce-fraktguide.html")
    public String wordpressFraktguide(){
        return "plugin/wordpress-e-commerce-fraktguide";
    }

    @RequestMapping("/plugin/zencart-fraktguide.html")
    public String zencartFraktguide(){
        return "plugin/zencart-fraktguide";
    }

    @RequestMapping("/widget/choose-pickup-point.html")
    public String choosePickupPoint(){
        return "widget/choosepickuppoint";
    }

    @RequestMapping("/widget/choose-pickup-point-with-map.html")
    public String choosePickupPointWithMap(){
        return "widget/choosepickuppointwithmap";
    }

    @RequestMapping("/widget/link-to-shipment-tracking.html")
    public String linkToShipmentTracking(){
        return "widget/linktoshipmenttracking";
    }

    @RequestMapping("widget/validate-postal-code.html")
    public String validatePostalCode(){
        return "widget/validatepostalcode";
    }

    @RequestMapping("widget/preview/choose-pickup-point-preview.html")
    public String choosePickupPointPreview(){
        return "widget/preview/choosepickuppoint-preview";
    }

    @RequestMapping("widget/preview/choose-pickup-point-with-map-preview.html")
    public String choosePickupPointWithMapPreview(){
        return "widget/preview/choosepickuppointwithmap-preview";
    }

    @RequestMapping("widget/preview/display-shipping-guide-info-preview.html")
    public String displayShippingGuideInfoPreview(){
        return "widget/preview/displayshippingguideinfo-preview";
    }

    @RequestMapping("widget/preview/product-selection-as-html-preview.html")
    public String productSelectionAsHtmlPreview(){
        return "widget/preview/productselectionashtml-preview";
    }

    @RequestMapping("widget/preview/tracking-link-preview.html")
    public String trackingLinkPreview(){
        return "widget/preview/trackinglink-preview";
    }

    @RequestMapping("widget/preview/validate-postal-code-preview.html")
    public String validatePostalCodePreview(){
        return "widget/preview/validatepostalcode-preview";
    }

    @RequestMapping("/api/easyreturnserviceapi.html")
    public String easyreturnserviceapi() {
        return "api/easyreturnserviceapi";
    }

    @RequestMapping("/widget/trackingcomponent.html")
    public String trackingComponent() {
        return "widget/trackingcomponent";
    }

    @RequestMapping("/additionalresources/homedeliveryproductlist.html")
    public String homeDeliveryProductList() { return "/additionalresources/homedeliveryproductlist"; }
    
}