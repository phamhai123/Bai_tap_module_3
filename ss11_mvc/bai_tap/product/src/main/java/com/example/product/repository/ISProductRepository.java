package com.example.product.repository;

import com.example.product.model.Product;

import java.util.List;

public interface ISProductRepository {
    List<Product> findAll();
    List<Product> searchName(String name);
    void save(Product product);
    Product findById(int id);
    void update(int id,Product product);
    void remove(int id);

}
