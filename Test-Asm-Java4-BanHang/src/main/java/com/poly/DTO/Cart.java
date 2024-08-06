package com.poly.DTO;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, Integer> products; // productId -> quantity

    public Cart() {
        products = new HashMap<>();
    }

    public void addProduct(int productId, int quantity) {
        if (products.containsKey(productId)) {
            products.put(productId, products.get(productId) + quantity);
        } else {
            products.put(productId, quantity);
        }
    }

    public Map<Integer, Integer> getProducts() {
        return products;
    }
}
