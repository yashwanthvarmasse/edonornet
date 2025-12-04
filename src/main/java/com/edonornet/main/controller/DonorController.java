package com.edonornet.main.controller;


import com.edonornet.main.model.Donor;
import com.edonornet.main.service.DonorService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

@Controller
public class DonorController {

    public final DonorService donorService;
    public DonorController(DonorService donorService){
        this.donorService=donorService;
    }

    @GetMapping("/donation_info")
    public String donation_info(){
        return "donor/donation_info";
    }

    @PostMapping("donor-registration")
    public String donor(@ModelAttribute Donor donor, HttpSession session){
        donor.setReason("");
        if(donor.getGender().equals("Male")&&donor.getHemoglobin()<13.0)
            donor.setReason(donor.getReason()+" ,The donor Hemoglobin is very low(Min 13.0 g/dL for Male).");
        if(donor.getGender().equals("Female")&&donor.getHemoglobin()<12.5)
            donor.setReason(donor.getReason()+" ,The donor Hemoglobin is very low(Min 12.5 g/dL for Female).");
        String [] bp=donor.getBloodPressure().split("/");
        int lowBp=Integer.parseInt(bp[1]);
        int highBp=Integer.parseInt(bp[0]);
        if(lowBp<70 || lowBp>110)
            donor.setReason(donor.getReason()+", The donor's blood pressure is unstable or below the required limit.");
        if(highBp<90 || highBp>140)
            donor.setReason(donor.getReason()+", The donor's blood pressure is unstable or above the required limit.");
        if (donor.getPulse() > 100 || donor.getPulse() < 60)
            donor.setReason(donor.getReason() + ", The donor's pulse is unstable.");
        if (donor.getTemperature() >= 37.5)
            donor.setReason(donor.getReason() + ", The donor's body temperature is too high!");
        if (donor.getGoodHealth().equals("no"))
            donor.setReason(donor.getReason() + ", The donor is not in good health.");
        if (donor.getTattoo().equals("yes"))
            donor.setReason(donor.getReason() + ", The donor has a tattoo on their body.");
        if (donor.getSick().equals("yes"))
            donor.setReason(donor.getReason() + ", The donor has been sick in the last few days.");
        if (donor.getTravel().equals("yes"))
            donor.setReason(donor.getReason() + ", The donor has traveled abroad in the past few days.");
        if (donor.getDisease().equals("yes"))
            donor.setReason(donor.getReason() + ", The donor has other medical conditions.");

        session.setAttribute("reasons",donor.getReason());
        if(!donor.getReason().equals("")) return "redirect:/user/donor/registration/failed";
        else{
            if(donor.getReason()==null)
                donor.setReason(Collections.emptyList().toString());
            donor.setDate(LocalDate.now());
            donor.setStatus("Pending Review");
            donorService.save(donor);
            session.setAttribute("donations",donorService.findDonor(donor.getEmail()));
            return "redirect:/user/donor/registration/successful/DNR-"+donor.getId();
        }
    }

    @GetMapping("/user/donor/registration/failed")
    public String failed(Model model,HttpSession session){
        String reasons= (String) session.getAttribute("reasons");
        List<String> listOfReasons= List.of(reasons.split(","));
        model.addAttribute("reasons",listOfReasons==null? Collections.emptyList():listOfReasons);
        model.addAttribute(session.getAttribute("logged_user"));
        return "donor/registration-failed";
    }

    @GetMapping("/user/donor/registration/successful/DNR-{id}")
    public String sucess(@PathVariable Long id, Model model,HttpSession session){
        Donor donor= donorService.findById(id);
        model.addAttribute(session.getAttribute("logged_user"));
        model.addAttribute("donor",donor);
        return "donor/donor-registration";
    }

    @GetMapping("/user/donor/registration/DNR-{id}")
    public String status(@PathVariable Long id,Model model,HttpSession session){
        Donor donor=donorService.findById(id);
        model.addAttribute(session.getAttribute("logged_user"));
        model.addAttribute("donor",donor);
        if (donor.getStatus().equals("Pending Review")) {
            return "donor/donor-status";
        }
        else{
            return "donor/donor-approval";
        }
    }
}
