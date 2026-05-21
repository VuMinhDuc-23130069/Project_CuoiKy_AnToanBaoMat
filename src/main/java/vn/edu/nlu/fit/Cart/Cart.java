package vn.edu.nlu.fit.Cart;

import vn.edu.nlu.fit.model.Products;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart implements Serializable {
    Map<Integer, CartItem> data;

    public Cart() {
        data = new HashMap<>();
    }
    public void List(Products products) {
    }

    // thêm Sản phẩm
    public void addItem(Products product, int quantity) {
        if (quantity <= 0) {
            quantity = 1;
        }
        if (data.containsKey(product.getId())) {
            // Nếu đã có → tăng số lượng
            data.get(product.getId()).upQuantity(quantity);
        } else {
            // Nếu chưa có → thêm mới
            data.put(product.getId(), new CartItem(product, quantity, product.getPrice()));
        }
    }

    //xóa Sản phẩm
    public CartItem deleteItem(int id) {
        return data.remove(id);
    }

    //Xóa tất cả SP
    public List<CartItem> deleteAll() {
        List<CartItem> cartItems = new ArrayList<>(data.values());
        data.clear();
        return cartItems;
    }

    //lấy ds các item
    public List<CartItem> getItem() {
        return new ArrayList<>(data.values());
    }
    public int getTotalQuantity(){
        AtomicInteger totalQuantity = new AtomicInteger();
        data.values().forEach(cartItem -> {totalQuantity.addAndGet(cartItem.getQuantity());});
        return totalQuantity.get();
    }

    public double getTotal(){
        AtomicReference<Double> sum = new AtomicReference<>((double) 0);
        data.values().forEach(cartItem -> sum.updateAndGet(v->v+(cartItem.getPrice()*cartItem.getQuantity())));
        return sum.get();
    }
    public CartItem getCartItem(int id){
        return data.get(id);
    }
    public void update(int id, int quantity) {
        CartItem item = getCartItem(id);

        if (item != null) {
            if (quantity < 1) {
                data.remove(id);
            } else {
                item.setQuantity(quantity);
            }


        }
    }







}