package com.snaphunt.seller.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.snaphunt.seller.Model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>{

    @Query("FROM Product WHERE seller_id=?1 ORDER BY id DESC")
    List<Product> getProductbySeller(String sellerID);

    @Modifying
    @Transactional
    @Query("DELETE FROM Product WHERE product_id=?1 and seller_id=?2")
    void deleteProductbyId(String productId,String SellerID);


    @Query("SELECT p.MainImagePublicID FROM Product p WHERE p.ProductId=?1")
    String MainImagePublicID(String productId);

    @Query("SELECT p.SecondImagePublicID FROM Product p WHERE p.ProductId=?1")
    String SecondImagePublicID(String productId);

    @Query("SELECT p.ThirdImagePublicID FROM Product p WHERE p.ProductId=?1")
    String ThirdImagePublicID(String productId);
    
    @Query("SELECT p.FourthImagePublicID FROM Product p WHERE p.ProductId=?1")
    String FourthImagePublicID(String productId);





    
}
