package com.edonornet.main.ExceptionHandling;


import com.edonornet.main.service.MailSenderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ErrorCatching {

    private final MailSenderService whatsappReporting;

    public ErrorCatching(MailSenderService whatsappReporting){
        this.whatsappReporting=whatsappReporting;
    }

    @PostMapping("/report-error")
    public String report(@RequestParam String details, @RequestParam String path, HttpSession session, HttpServletRequest request, Model model, Exception exception){

        String exception_reason=exception.getClass().getName();
        String message=exception.getMessage();
        whatsappReporting.sendException(details,path,session,model);
        return "redirect:/";
    }
}
