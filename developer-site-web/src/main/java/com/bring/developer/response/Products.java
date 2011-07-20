package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;



@XmlRootElement(name = "Products")
public class Products {
    
    @XmlElement(name = "Product")
    private List<Product> product = new ArrayList<Product>();
    
    @XmlElement(name = "AdditionalService")
    private List<AdditionalService> additionalService = new ArrayList<AdditionalService>();

    @XmlElement(name = "Note")
    private Note note;
    
    public List<Product> getProducts() {
        return product;
    }
    
    public Product getProduct(int i){
        return product.get(i);
    }

    public List<AdditionalService> getAdditionalService() {
        return additionalService;
    }
    
    public Note getNote() {
        return note;
    }
    
}