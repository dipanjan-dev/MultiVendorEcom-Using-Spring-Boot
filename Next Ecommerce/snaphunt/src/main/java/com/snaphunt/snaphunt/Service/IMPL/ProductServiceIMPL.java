package com.snaphunt.snaphunt.Service.IMPL;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snaphunt.snaphunt.Model.Product;
import com.snaphunt.snaphunt.Repository.ProductRepository;
import com.snaphunt.snaphunt.Service.ProductService;

@Service
public class ProductServiceIMPL implements ProductService{

    @Autowired
    ProductRepository productRepository;

    @Override
    public List<Product> geProducts() {
       return productRepository.findAll();
    }

    @Override
    public Product getProductDetails(String ProductName, String ProductId) {
        return productRepository.getProductDetails(ProductName,ProductId);
    }

}
