package com.snaphunt.seller.Service.IMPL;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.snaphunt.seller.Model.Product;
import com.snaphunt.seller.Service.CloudinaryImageService;


@Service
public class CloudinaryImageServiceIMPL implements CloudinaryImageService{

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public Map upload(MultipartFile file) {
        try {
            Map UploadData = this.cloudinary.uploader().upload(file.getBytes(),Map.of());
            return UploadData;
        } catch (IOException e) {
            throw new RuntimeException("Image upload failed. Please check server side code");

        }
    }

    @Override
    public void DeleteFile(String public_id) {
        try {
            Map result = cloudinary.uploader().destroy(public_id, Map.of());
            
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    
}
