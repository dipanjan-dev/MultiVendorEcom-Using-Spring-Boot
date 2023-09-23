package com.snaphunt.seller.Controller.DashboardController;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.snaphunt.seller.Model.Product;
import com.snaphunt.seller.Service.CloudinaryImageService;
import com.snaphunt.seller.Service.ProductService;

@Controller
@RequestMapping(value = "/seller")
public class ProductController {
    
    @Autowired
    private ProductService productService;

    
    @Autowired
    private CloudinaryImageService cloudinaryImageService;

    @GetMapping(value = "/view-product")
    public String ViewProduct(HttpSession session){
        String SellerID = session.getAttribute("SellerID").toString();
        List<Product> product = productService.viewProduct(SellerID);
        session.setAttribute("productData", product);
        if(SellerID!=null){
        return "dashboard/viewProduct";
        }
        return "redirect /login";
    }

    @GetMapping(value = "/delete-item/product/{sellerID}/{productId}")
    public String deleteProduct(@PathVariable("sellerID") String sellerID,@PathVariable("productId") String productId,RedirectAttributes rd) throws IOException{
        
        cloudinaryImageService.DeleteFile(productService.MainImagePublicID(productId));
        cloudinaryImageService.DeleteFile(productService.SecondImagePublicID(productId));
        cloudinaryImageService.DeleteFile(productService.ThirdImagePublicID(productId));
        cloudinaryImageService.DeleteFile(productService.FourthImagePublicID(productId));
        productService.deleteproduct(productId, sellerID);
        // String baseDirectory = "E:\\Next Ecommerce\\ImageBucket\\";
        // File imageFolderUrl = new File(baseDirectory+sellerID+"/products/"+productId);
        // FileUtils.deleteDirectory(imageFolderUrl);
        // System.out.println(imageFolderUrl);

        rd.addFlashAttribute("deleteDone", "Product Delete Successfully");
        return "redirect:/seller/view-product";
    }

}
