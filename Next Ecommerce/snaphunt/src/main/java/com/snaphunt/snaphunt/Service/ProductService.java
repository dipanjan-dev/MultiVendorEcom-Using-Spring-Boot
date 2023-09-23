package com.snaphunt.snaphunt.Service;

import java.util.List;

import com.snaphunt.snaphunt.Model.Product;

public interface ProductService {
    public List<Product> geProducts();
    public Product getProductDetails(String ProductName,String ProductId);
}
