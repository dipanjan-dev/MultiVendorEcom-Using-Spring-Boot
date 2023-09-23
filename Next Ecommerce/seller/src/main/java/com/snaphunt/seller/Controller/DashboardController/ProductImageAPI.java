package com.snaphunt.seller.Controller.DashboardController;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/product-images")
public class ProductImageAPI {

    @GetMapping("/main-image/{productId}/{productImage}")
    public ResponseEntity<Resource> getImage(@PathVariable("productId")String productId,@PathVariable("productImage")String imageName) throws IOException {

        Path imagePath = Paths.get("src/main/resources/static/images/", imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());

        if (imageResource.exists() && imageResource.isReadable()) {
            return ResponseEntity.ok().body(imageResource);
        } else {
            // Handle the case when the image does not exist or is not readable
            return ResponseEntity.notFound().build();
        }
    }
}
