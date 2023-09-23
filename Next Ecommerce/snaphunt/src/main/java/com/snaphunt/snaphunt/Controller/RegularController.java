package com.snaphunt.snaphunt.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.snaphunt.snaphunt.Model.Product;
import com.snaphunt.snaphunt.Service.ProductService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegularController {

    @Autowired
    ProductService productService;

    @GetMapping(value = "/")
    public String index(HttpSession session){
        List<Product> Allproducts = productService.geProducts();
        session.setAttribute("Allproducts", Allproducts);
        return "index";
    }

    @GetMapping(value = "/product-view/{productName}/{productId}")
    public String productDetails(HttpSession session,@PathVariable("productName") String productName,
                                  @PathVariable("productId") String productId){

        Product productDetails = productService.getProductDetails(productName,productId);
        session.setAttribute("productDetails" , productDetails);
        return "productDetails";
    }


}
