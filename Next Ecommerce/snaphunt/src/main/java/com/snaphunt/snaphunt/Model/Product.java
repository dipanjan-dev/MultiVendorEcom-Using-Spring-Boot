package com.snaphunt.snaphunt.Model;

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
    private String SecondImage;
    private String ThirdImage;
    private String FourthImage;
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
