package com.bring.developer.response.productlist;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;



@XmlRootElement(name = "Products")
public class Products {
    
    private List<Product> product = new ArrayList<Product>();    
    private List<AdditionalService> additionalService = new ArrayList<AdditionalService>();
    private Note note;
    
    @XmlElement(name = "Product")
    public List<Product> getProducts() {
        return product;
    }
    
    public Product getProduct(int i){
        return product.get(i);
    }

    @XmlElement(name = "AdditionalService")
    public List<AdditionalService> getAdditionalService() {
        return additionalService;
    }
    
    @XmlElement(name = "Note")
    public Note getNote() {
        return note;
    }
    
}