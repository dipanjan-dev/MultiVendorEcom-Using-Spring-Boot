package com.snaphunt.seller.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snaphunt.seller.Model.SellerUser;
import com.snaphunt.seller.Service.EmailService;
import com.snaphunt.seller.Service.SellerUserService;

@Controller
public class RegisterController {
    @Autowired
    SellerUserService sellerUserService;

    @Autowired
    private EmailService emailService;

    @GetMapping(value = "/register-seller")
    public String register() {
        return "register";
    }

    enum SellerStatus{
        pending,
        active,
        blocked
    }

    @PostMapping(value = "/seller-info-save")
    public String registerSeller(@ModelAttribute("SellerUser") SellerUser SellerUser,@RequestParam("Email")String Email,@RequestParam("Contact")String Contact,@RequestParam("GST")String GST,@RequestParam("AddhaarCard")String AddhaarCard,@RequestParam("PanCard")String PanCard,@RequestParam("Password")String Password,@RequestParam("RepeatPassword")String RepeatPassword,Model model,RedirectAttributes rd,HttpSession session) {
        if(sellerUserService.getSellerByEmail(Email) == null){
            if(sellerUserService.getSellerByContact(Contact)==null){
                if(Password.equals(RepeatPassword)){
                    if(Password.length()<=8 && Password.length()>=16){
                         rd.addFlashAttribute("PasswordLength", "Password Minimum length is 8 and Maximum 16"); 
                          return "redirect:/register-seller";
                    }
                    else{
                    int useridPin=(int) (Math.random()*900000)+100000;
                    String userid="U-" + String.valueOf(useridPin);
                    SellerUser.setUserid(userid);

                    int SellerIDPIN=(int) (Math.random()*900000000)+10000000;
                    String SellerId="UNVS-" + String.valueOf(SellerIDPIN);
                    SellerUser.setSellerid(SellerId);

                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
                    String currentDate = formatter.format(date);
                    SellerUser.setCreateDate(currentDate);
                    SellerUser.setStatus(SellerStatus.active.toString());
                    SellerUser.setSecureAuth(false);

                    // OTP
                    int OTP=(int) (Math.random()*90000)+100000;
                    String registerOTP=String.valueOf(OTP);
                    session.setAttribute("SellerData", SellerUser);
                    session.setAttribute("registerOTP", registerOTP);
                    String to = Email;
                    String subject = "Seller verification From universe";
                    String text = "Hello " + SellerUser.getFirstName() + ",\n\n"
                        + "Welcome to Universe! This email is to verify your seller registration. Please find your verification code below:\n\n"
                        + "Verification Code: " + registerOTP + "\n\n"
                        + "If you did not initiate this registration, please ignore this email or contact our support team immediately.\n\n"
                        + "Best regards,\nUniverse Seller Support Team";
                    

                    emailService.sendEmail(to, subject, text);
                    return "redirect:/verification";
                    }

                }
                else{
                    rd.addFlashAttribute("errorPassword", "Password and Repeat Password Not matched"); 
                    return "redirect:/register-seller";
                }
            }
            else{
               rd.addFlashAttribute("ContactHave", Contact+" Already Registered"); 
               return "redirect:/register-seller";
            }

        }
        rd.addFlashAttribute("EmailHave",  Email+" Already Registered");
        return "redirect:/register-seller";
        
    }

    @GetMapping("/verification")
    public String Otpverification(){

        return "otpverificationseller";
       
    }

    @PostMapping("/Otpverification")
    public String OtpverificationPost(@RequestParam("otp") String otp,HttpSession session,Model model,RedirectAttributes rd){
        String registerOTP = session.getAttribute("registerOTP").toString();
        SellerUser sellerUser =  (SellerUser) session.getAttribute("SellerData");
        if(registerOTP.equals(otp.trim())){
                sellerUserService.createSeller(sellerUser);
                    String to = sellerUser.getEmail();
                    String subject = "Welcome to Universe | Seller Account Created";
                    String userFullName = sellerUser.getFirstName(); 
                    String text = "Dear " + userFullName + ",\n\n"
                        + "Welcome to our platform! We are thrilled to have you join our community.\n\n"
                        + "At Universe, we strive to provide the best experience for our users.\n\n"
                        + "Feel free to explore our services, connect with other members, and take advantage of all the features we offer.\n\n"
                        + "If you have any questions or need assistance, our support team is here to help.\n\n"
                        + "Thank you for choosing us. We're excited to embark on this journey together!\n\n"
                        + "Best regards,\nThe Universe Team";   

                    emailService.sendEmail(to, subject, text);
                rd.addFlashAttribute("sellercomplete", " Registered"); 
                return "redirect:/login";

        }
        rd.addFlashAttribute("wrongOTP", "Please Enter Valid Code"); 
        return "redirect:/verification";
    }

    
}
