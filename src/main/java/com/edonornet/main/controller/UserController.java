package com.edonornet.main.controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {


    @GetMapping("/")
    public String index(HttpSession session){
        String os=System.getProperty("os.name");
        session.setAttribute("os",os);
        return "index";
    }

    @GetMapping("/user/signin")
    public String signin(){
        return "user/signin";
    }

    @GetMapping("/user/signup")
    public String signup(HttpSession session){
        return "user/signup";
    }

    @GetMapping("/user/logout")
    public String userlogout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}
