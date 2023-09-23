package com.snaphunt.seller.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table
@Entity
@Data
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String ProductId;
    private String SellerId;
    private String Catrgory;
    private String SubCatrgory;
    private String ItemName;
    private String BrandName;
    private String MainImage;
    private String MainImagePublicID;
    private String SecondImage;
    private String SecondImagePublicID;
    private String ThirdImage;
    private String ThirdImagePublicID;
    private String FourthImage;
    private String FourthImagePublicID;
    @Column(length = 2000)
    private String ShortDescription;
    @Column(length = 2000)
    private String FullDescription;
    private String Mrp;
    private String Bdp;
    private String Mdp;
    private String Stock;
    private String keywords;
    private String UploadedAt;
    private String UpdatedAt;
    private String Status;
}
