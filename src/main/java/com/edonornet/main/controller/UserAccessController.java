package com.edonornet.main.controller;


import com.edonornet.main.model.Login_info;
import com.edonornet.main.model.User;
import com.edonornet.main.service.DonorService;
import com.edonornet.main.service.LoginService;
import com.edonornet.main.service.RecipientService;
import com.edonornet.main.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserAccessController {

    public final UserService userService;
    public final LoginService loginService;
    public final DonorService donorService;
    public final RecipientService recipientService;
    UserAccessController(UserService userService, LoginService loginService, DonorService donorService, RecipientService recipientService){
        this.userService=userService;
        this.loginService=loginService;
        this.donorService=donorService;
        this.recipientService=recipientService;
    }
    @PostMapping("/validate_user")
    public String validate_user(String email,String password,HttpSession session){
        Login_info user_login=new Login_info();
        User user1=userService.find(email);
        if(user1==null){
            user_login.setStatus("Failed");
            user_login.setEmail(email);
            user_login.setReason("User not found in the Database");
            loginService.save(user_login);
            return "user_password/notfound";
        }
        else{
            User user=userService.findUser(email,password);
            if(user==null){
                user_login.setStatus("Failed");
                user_login.setEmail(email);
                user_login.setReason("Incorrect Password");
                loginService.save(user_login);
                return "user_password/incorrect";
            }

            else{
                user_login.setStatus("Successfull");
                user_login.setEmail(email);
                loginService.save(user_login);
                session.setAttribute("logged_user",user);
                return "redirect:/user/dashboard";
            }
        }
    }

    @PostMapping("/create_user")
    public String create_user(@ModelAttribute User user){

        if(userService.findByEmail(user.getEmail()))
            return "user_password/exists";
        else{
            user.setFirstname(user.getFirstname().substring(0,1).toUpperCase()+user.getFirstname().substring(1).toLowerCase());
            user.setLastname(user.getLastname().substring(0,1).toUpperCase()+user.getLastname().substring(1).toLowerCase());
            userService.saveuser(user);
            return "redirect:/user/signin";
        }

    }

}
