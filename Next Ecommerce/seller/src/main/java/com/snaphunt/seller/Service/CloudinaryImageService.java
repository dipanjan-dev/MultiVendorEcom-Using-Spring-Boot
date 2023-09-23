package com.snaphunt.seller.Service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface CloudinaryImageService {
    public Map upload(MultipartFile file);
    public void DeleteFile(String public_id);
}
