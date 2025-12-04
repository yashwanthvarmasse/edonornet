package com.edonornet.main.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/signin")
    public String signin(){
        return "admin/admin-signin";
    }

    @GetMapping("/signup")
    public String signup(){
        return "admin/admin-signup";
    }

    @GetMapping("/forgotpassword")
    public String forgot(){
        return "admin/credential-support";
    }

    @GetMapping("/logout")
    public String adminlogout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }


}
