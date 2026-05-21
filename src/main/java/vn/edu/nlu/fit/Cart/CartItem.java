package vn.edu.nlu.fit.Cart;

import vn.edu.nlu.fit.model.Products;

import java.io.Serializable;


public class CartItem implements Serializable {
    private Products product;
    private int quantity;
    private double price;

    public CartItem(Products product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public double getTotal(){
        return quantity*price;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartItem() {
    }

    public void upQuantity(int quatity) {
        this.quantity += quatity;
    }


}