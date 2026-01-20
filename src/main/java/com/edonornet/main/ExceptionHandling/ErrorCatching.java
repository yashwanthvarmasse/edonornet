package com.edonornet.main.ExceptionHandling;


import com.edonornet.main.service.WhatsappReporting;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ErrorCatching {

    private final WhatsappReporting whatsappReporting;

    public ErrorCatching(WhatsappReporting whatsappReporting){
        this.whatsappReporting=whatsappReporting;
    }

    @PostMapping("/report-error")
    public String report(@RequestParam String details, @RequestParam String path, HttpSession session){
        whatsappReporting.sendException(details,path,session);
        return "redirect:/";
    }
}
