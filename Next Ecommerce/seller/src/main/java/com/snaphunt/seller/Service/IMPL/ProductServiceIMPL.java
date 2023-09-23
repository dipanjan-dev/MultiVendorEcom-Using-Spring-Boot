package com.snaphunt.seller.Service.IMPL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snaphunt.seller.Model.Product;
import com.snaphunt.seller.Repository.ProductRepository;
import com.snaphunt.seller.Service.ProductService;

@Service
public class ProductServiceIMPL implements ProductService {

    @Autowired
    ProductRepository productRepository;

    @Override
    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> viewProduct(String SellerID) {
       return productRepository.getProductbySeller(SellerID);
    }

    @Override
    public void deleteproduct(String ProductId,String SellerID) {
        productRepository.deleteProductbyId(ProductId,SellerID);
    }

    @Override
    public String MainImagePublicID(String ProductId) {
        return productRepository.MainImagePublicID(ProductId);
    }

    @Override
    public String SecondImagePublicID(String ProductId) {
       return productRepository.SecondImagePublicID(ProductId);
    }

    @Override
    public String ThirdImagePublicID(String ProductId) {
       return productRepository.ThirdImagePublicID(ProductId);
    }

    @Override
    public String FourthImagePublicID(String ProductId) {
       return productRepository.FourthImagePublicID(ProductId);
    }

    


}
