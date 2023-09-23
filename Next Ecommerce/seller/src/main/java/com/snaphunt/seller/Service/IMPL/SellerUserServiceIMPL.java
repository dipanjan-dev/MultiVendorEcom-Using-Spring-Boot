package com.snaphunt.seller.Service.IMPL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snaphunt.seller.Model.SellerUser;
import com.snaphunt.seller.Repository.SellerUserRepository;
import com.snaphunt.seller.Service.SellerUserService;

@Service
public class SellerUserServiceIMPL implements SellerUserService{
    @Autowired
    SellerUserRepository sellerUserRepository;


    @Override
    public SellerUser createSeller(SellerUser sellerUser) {
        return sellerUserRepository.save(sellerUser);
    }


    @Override
    public SellerUser getSellerByEmail(String Email) {
        return sellerUserRepository.getSellerByEmail(Email);
    }


    @Override
    public SellerUser getSellerByContact(String Contact) {
        return sellerUserRepository.getSellerByContact(Contact);
    }


    @Override
    public SellerUser getSellerByGST(String GST) {
         return sellerUserRepository.getSellerByGST(GST);
    }


    @Override
    public SellerUser getSellerByAadharCard(String AadharCard) {
        return sellerUserRepository.getSellerByAadharCard(AadharCard);
    }


    @Override
    public SellerUser getSellerByPanCard(String PanCard) {
        return sellerUserRepository.getSellerByPanCard(PanCard);
    }


    @Override
    public void changepassword(String email,String Password) {
        sellerUserRepository.changepassword(email,Password);
    }


}
