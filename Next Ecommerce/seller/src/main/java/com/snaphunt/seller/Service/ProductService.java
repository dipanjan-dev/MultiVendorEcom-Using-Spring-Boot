package com.snaphunt.seller.Service;
import java.util.List;

import com.snaphunt.seller.Model.Product;

public interface ProductService {
    public Product addProduct(Product product);  
    public List<Product> viewProduct(String SellerID);  
    void deleteproduct(String ProductId,String SellerID);
    // public List<Product> getSellerByProduct()

    // PUBLIC ID OF CLOUDINARY
    public String MainImagePublicID(String ProductId);
    public String SecondImagePublicID(String ProductId);
    public String ThirdImagePublicID(String ProductId);
    public String FourthImagePublicID(String ProductId);
}
