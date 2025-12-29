package com.edonornet.main.controller;


import com.edonornet.main.model.Donor;
import com.edonornet.main.model.Recipient;
import com.edonornet.main.model.User;
import com.edonornet.main.service.DonorService;
import com.edonornet.main.service.RecipientService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserDashboardController {
    public final DonorService donorService;
    public final RecipientService recipientService;
    UserDashboardController(DonorService donorService, RecipientService recipientService){
        this.donorService=donorService;
        this.recipientService=recipientService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model){
        //here the login can be validated again...
        User user= (User) session.getAttribute("logged_user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("logged_user",user);
        List<Donor> donations = donorService.findDonor(user.getEmail());
        List<Recipient> requests =recipientService.findRecipient(user.getEmail());
        model.addAttribute("donations",donations==null? Collections.emptyList():donations);
        model.addAttribute("requests",requests==null?Collections.emptyList():requests);
        return "user/dashboard";
    }

    @GetMapping("/donor")
    public String donor(Model model,HttpSession session){
        model.addAttribute("logged_user",session.getAttribute("logged_user"));
        return "donor/donor";
    }

    @GetMapping("/recipient")
    public String recipient(Model model,HttpSession session){
        model.addAttribute("logged_user",session.getAttribute("logged_user"));
        return "recipient/recipient";
    }
    
}
