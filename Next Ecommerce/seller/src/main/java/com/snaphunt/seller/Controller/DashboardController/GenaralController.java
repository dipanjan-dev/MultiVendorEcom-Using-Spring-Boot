package com.snaphunt.seller.Controller.DashboardController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/seller")
public class GenaralController {
    
    @GetMapping()
    public String index(){
        return "dashboard/home";
    }
    @GetMapping(value = "/add-product")
    public String addProduct(){
        return "dashboard/add-product";
    }

    @GetMapping(value="/profile")
    public String SellerProfile(){
        return "dashboard/Profile";
    }

    
}
