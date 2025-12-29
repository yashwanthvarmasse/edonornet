package com.edonornet.main.controller;

import com.edonornet.main.model.Donor;
import com.edonornet.main.model.Recipient;
import com.edonornet.main.model.User;
import com.edonornet.main.service.RecipientService;
import com.edonornet.main.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;

@Controller
public class RecipientController {

    private final RecipientService recipientService;

    public RecipientController(RecipientService recipientService, UserService userService){
        this.recipientService=recipientService;
        //this.userService = userService;
    }


    @GetMapping("/recipient_info")
    public String recipient_info(){
        return "recipient/recipient_info";
    }

    @PostMapping("/request-blood")
    public String request(@ModelAttribute Recipient recipient, Model model, HttpSession session){

        User user= (User) session.getAttribute("logged_user");
        recipient.setEmail(user.getEmail());
        recipient.setStatus("Pending Review");
        recipient.setDate(LocalDate.now());
        recipientService.save(recipient);
        model.addAttribute("recipient",recipient);
        return "redirect:/user/recipient/registration/RCP-"+recipient.getId();
    }

    @GetMapping("/user/recipient/registration/RCP-{id}")
    public String status(@PathVariable Long id,Model model,HttpSession session){
        Recipient recipient=recipientService.findById(id);
        model.addAttribute("logged_user",session.getAttribute("logged_user"));
        model.addAttribute("recipient",recipient);
        if (recipient.getStatus().equals("Pending Review")) {
            return "recipient/recipient-status";
        }
        else if (recipient.getStatus().equals("Approved")){
            return "recipient/recipient-approval";
        }
        else if(recipient.getStatus().equals("Rejected")){
            return "recipient/request-failed";
        }
        else{
            return "recipient/recipient-received";
        }
    }
}
