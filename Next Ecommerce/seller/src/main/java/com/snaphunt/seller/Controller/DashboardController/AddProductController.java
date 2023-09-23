package com.snaphunt.seller.Controller.DashboardController;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.snaphunt.seller.General.FileUpload;
import com.snaphunt.seller.Model.Product;
import com.snaphunt.seller.Service.CloudinaryImageService;
import com.snaphunt.seller.Service.ProductService;

import org.springframework.util.StringUtils;

@Controller
@RequestMapping(value = "/seller")
public class AddProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CloudinaryImageService cloudinaryImageService;

    @PostMapping(value = "/upload-product")
    public String uploadProduct(Model model,HttpSession session,
    @RequestParam("Catrgory") String Catrgory,
    @RequestParam("SubCatrgory") String SubCatrgory,
    @RequestParam("ItemName") String ItemName,
    @RequestParam("BrandName") String BrandName,
    @RequestParam("ShortDescription") String ShortDescription,
    @RequestParam("FullDescription") String FullDescription,
    @RequestParam("Mrp") String Mrp,
    @RequestParam("Bdp") String Bdp,
    @RequestParam("Mdp") String Mdp,
    @RequestParam("Stock") String Stock,
    @RequestParam("keywords") String keywords,
    @RequestParam("MainImage") MultipartFile Mainimage,
    @RequestParam("SecondImage") MultipartFile SecondImage,
    @RequestParam("ThirdImage") MultipartFile ThirdImage,
    @RequestParam("FourthImage") MultipartFile FourthImage) throws IOException{

            Product product = new Product();
            String SellerID = session.getAttribute("SellerID").toString();
            int ProductIDNew=(int) (Math.random()*9000000)+100100000;
            String UPID=String.valueOf(ProductIDNew);
            Date date = new Date();

            product.setCatrgory(Catrgory);
            product.setSubCatrgory(SubCatrgory);
            product.setItemName(ItemName);
            product.setBrandName(BrandName);
            product.setShortDescription(ShortDescription);
            product.setFullDescription(FullDescription);

            // String baseDirectory = "E:\\Next Ecommerce\\ImageBucket\\" + SellerID + "/products/";
            product.setMrp(Mrp);
            product.setBdp(Bdp);
            product.setMdp(Mdp);
            product.setStock(Stock);
            product.setKeywords(keywords);
            product.setUploadedAt(date.toString());
            product.setProductId("UPID-"+UPID);
            product.setSellerId(SellerID);
            Map MainImageResponse = this.cloudinaryImageService.upload(Mainimage);
            Map SecondImageResponse = this.cloudinaryImageService.upload(SecondImage);
            Map ThirdImageResponse = this.cloudinaryImageService.upload(ThirdImage);
            Map FourthImageResponse = this.cloudinaryImageService.upload(FourthImage);
    
            String MainImageUrl = (String) MainImageResponse.get("url");
            String MainImagePublicId = (String) MainImageResponse.get("public_id");

            String SecondImageUrl = (String) SecondImageResponse.get("url");
            String SecondImagePublicId = (String) SecondImageResponse.get("public_id");

            String ThirdImageUrl = (String) ThirdImageResponse.get("url");
            String ThirdImagePublicId = (String) ThirdImageResponse.get("public_id");

            String FourthImageUrl = (String) FourthImageResponse.get("url");
            String FourthImagePublicId = (String) FourthImageResponse.get("public_id");

            

            product.setMainImage(MainImageUrl);
            product.setSecondImage(SecondImageUrl);
            product.setThirdImage(ThirdImageUrl);
            product.setFourthImage(FourthImageUrl);

            product.setMainImagePublicID(MainImagePublicId);
            product.setSecondImagePublicID(SecondImagePublicId);
            product.setThirdImagePublicID(ThirdImagePublicId);
            product.setFourthImagePublicID(FourthImagePublicId);


            productService.addProduct(product);
            return "redirect:/seller/view-product"; 
      
    }
}
