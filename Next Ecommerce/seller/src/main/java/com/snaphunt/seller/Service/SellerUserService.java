package com.snaphunt.seller.Service;

import com.snaphunt.seller.Model.SellerUser;

public interface SellerUserService {
    public SellerUser createSeller(SellerUser sellerUser);
    public SellerUser getSellerByEmail(String Email);
    public SellerUser getSellerByContact(String Contact);
    public SellerUser getSellerByGST(String GST);
    public SellerUser getSellerByAadharCard(String AadharCard);
    public SellerUser getSellerByPanCard(String PanCard);
    void changepassword(String email,String Password);
}
