package com.snaphunt.seller.Repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.snaphunt.seller.Model.SellerUser;

@Repository
public interface SellerUserRepository extends JpaRepository<SellerUser,Long>{
    
    @Query("FROM SellerUser WHERE email=?1")
    SellerUser getSellerByEmail(String email);

    @Query("FROM SellerUser WHERE contact=?1")
    SellerUser getSellerByContact(String contact);

    @Query("FROM SellerUser WHERE gst=?1")
    SellerUser getSellerByGST(String gST);

    @Query("FROM SellerUser WHERE addhaar_card=?1")
    SellerUser getSellerByAadharCard(String aadharCard);

    @Query("FROM SellerUser WHERE pan_card=?1")
    SellerUser getSellerByPanCard(String panCard);

    @Modifying
    @Transactional
    @Query("UPDATE SellerUser SET password=?2 where email=?1")
    void changepassword(String email,String Password);
    
}
