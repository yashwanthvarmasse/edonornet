package com.edonornet.main.controller;


import com.edonornet.main.model.Admin;
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
@RequestMapping("/admin")
public class AdminDashboardController {

    public final DonorService donorService;
    public final RecipientService recipientService;
    AdminDashboardController(DonorService donorService, RecipientService recipientService){
        this.donorService=donorService;
        this.recipientService=recipientService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model){
        model.addAttribute("logged_admin",session.getAttribute("logged_admin"));
        List<Donor> donations = donorService.findAll();
        List<Recipient> requests =recipientService.findAll();
        model.addAttribute("donations",donations==null? Collections.emptyList():donations);
        model.addAttribute("requests",requests==null?Collections.emptyList():requests);
        return "admin/admin-dashboard";
    }

    @GetMapping("/donor/panel")
    public String donor(){
        return "admin/donor-control";
    }

    @GetMapping("/request/panel")
    public String request(){
        return "admin/blood-request-control";
    }

    @GetMapping("/drives")
    public String drives(){
        return "admin/drives";
    }

}
