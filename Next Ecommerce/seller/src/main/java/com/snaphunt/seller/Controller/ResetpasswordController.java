package com.snaphunt.seller.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snaphunt.seller.Model.SellerUser;
import com.snaphunt.seller.Service.EmailService;
import com.snaphunt.seller.Service.SellerUserService;

@Controller
public class ResetpasswordController {
    @Autowired
    SellerUserService sellerUserService;

    @Autowired
    private EmailService emailService;

    @GetMapping(value = "/reset-password")
    public String resetPassword(){
        return "resetpassword";
    }
    
    @PostMapping(value = "/get-recoveryemail")
    public String getRecoveryemail(HttpSession session,@RequestParam("Email")String Email,RedirectAttributes rd){
        SellerUser sellerUser = sellerUserService.getSellerByEmail(Email);
        if(sellerUser != null){

            session.setAttribute("SellerData", sellerUser.getEmail());
            session.setAttribute("SellerName", sellerUser.getFirstName());
            int OTP=(int) (Math.random()*50000)+100000;
            String verificationCode=String.valueOf(OTP);
            session.setAttribute("verificationCode", verificationCode);

            String to = Email;
            String subject = "Account Recovery | Universe Seller Support team";
            String text = "Dear "+sellerUser.getFirstName()+ ",\n\nWe would like to inform you that a verification code has been generated for your account. Please find the details below:\n\nVerification Code: " + verificationCode + "\n\nThank you for your cooperation.\n\nBest regards,\nUniverse Seller Support Team";

            emailService.sendEmail(to, subject, text);
            return "otpverification";
        }
        
        rd.addFlashAttribute("usernotFound", Email+" is not registered");
        return "redirect:/reset-password";
    }

    @GetMapping(value = "/reset-otp")
    public String otpVerfiy(HttpSession session){
        return "otpverification";
    }

    @PostMapping(value = "/verification-code")
    public String verificationCode(HttpSession session,@RequestParam("otp")String OTP,RedirectAttributes rd){
        String verificationCode = (String)session.getAttribute("verificationCode");
        
        if(OTP.trim().equals(verificationCode.trim())){
            return "redirect:/change-password";
        }
        
        rd.addFlashAttribute("wrongOTP", "Please Enter a valid verification code");
        return "redirect:/reset-otp";
    }

    @GetMapping(value = "/change-password")
    public String changePassword(){
        return "changepassword";
    }

    @PostMapping(value = "/changePassword-seller")
    public String sellerPasswordReset(HttpSession session,@RequestParam("Password")String Password,@RequestParam("RPassword")String RPassword,RedirectAttributes rd){

        String SellerEmail = (String)session.getAttribute("SellerData");
        String SellerName = (String)session.getAttribute("SellerName");
        if(Password.equals(RPassword)){
            sellerUserService.changepassword(SellerEmail, Password);

            String to = SellerEmail;
            String subject = "Password Changed Successfully | Universe Seller Support team";
            String text = "Hello " + SellerName + ",\n\nThis is to confirm that your password for your account has been successfully changed. Below are the updated details:\n\nUsername: " + SellerEmail + "\nNew Password: " + Password + "\n\nIf you did not initiate this change, please contact our support team immediately.\n\nBest regards,\nUniverse Seller Support team";
            emailService.sendEmail(to, subject, text);
            rd.addFlashAttribute("changePassword", "Password Changed Successfully");
            return "redirect:/login";
        }
        rd.addFlashAttribute("wrongpassword", "Password and Retype Password Not Matched");
        return "redirect:/change-password";
    }

}
