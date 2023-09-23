package com.snaphunt.seller.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table
@Data
public class SellerUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    @Column(nullable = false, unique = true)   
    private String Userid;  
    @Column(nullable = false, unique = true)    
    private String Sellerid;        
    private String FirstName;
    private String LastName;
    private String Email;
    private String Contact;
    private String Address;
    private String Country;
    private String State;
    private String BusinessName;
    private String BusinessCategory;
    private String GST;
    private String AddhaarCard;
    private String PanCard;
    private String dateofbirth;
    private String createDate;
    private String status;
    private String Password;
    private Boolean SecureAuth;
}
