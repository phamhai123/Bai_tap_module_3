package com.example.product.service;

import com.example.product.model.Product;
import com.example.product.repository.ISProductRepository;
import com.example.product.repository.ISProductRepositoryImpl;
import java.util.List;

public class ProductServiceImp implements ProductService {
    private ISProductRepository repository = new ISProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public List<Product> searchName(String name) {
        return repository.searchName(name);
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        repository.update(id,product);
    }

    @Override
    public void remove(int id) {
        repository.remove(id);
    }
}
