package com.snaphunt.seller.Controller;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snaphunt.seller.Model.SellerUser;
import com.snaphunt.seller.Service.SellerUserService;

@Controller
public class loginController {
    
    @Autowired
    SellerUserService sellerUserService;


    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @PostMapping(value = "/verify-seller-login")
    public String loginAuth(@RequestParam("Password")String Password,@RequestParam("Email")String Email,HttpSession session,HttpServletResponse response,RedirectAttributes rd){

        SellerUser SellerUser = sellerUserService.getSellerByEmail(Email);
        if(SellerUser != null){
            if(SellerUser.getPassword().equals(Password)){


                session.setAttribute("userData", SellerUser);
                session.setAttribute("SellerID", SellerUser.getSellerid());
                return "redirect:/seller";
            }
            else{
                rd.addFlashAttribute("failedLogin", "Invalid credentials"); 
                return "redirect:/login";
            }
        }
        rd.addFlashAttribute("usernotFound", Email +" is not Registered"); 
        return "redirect:/login";

    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession session){
        if(session!=null){
            session.invalidate();
            return "redirect:/login";

        }
        return "redirect:/login";
    }
}
