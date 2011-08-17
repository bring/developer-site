package com.bring.developer.response.productlist;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;



@XmlRootElement(name = "Products")
public class Products {
    
    private List<Product> product = new ArrayList<Product>();    
    private List<AdditionalService> additionalService = new ArrayList<AdditionalService>();
    private List<Note> note = new ArrayList<Note>();
    
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
    public List<Note> getNote() {
        return note;
    }
    
}