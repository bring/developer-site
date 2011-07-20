package com.bring.developer.response;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;



@XmlRootElement(name = "products")
public class Products {
    
    @XmlElement(name = "Product")
    private List<Product> product = new ArrayList<Product>();

    public List<Product> getProduct() {
        return product;
    }
    
}