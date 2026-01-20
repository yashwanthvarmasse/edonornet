package com.edonornet.main.service;


import com.edonornet.main.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDateTime;

@Service
public class MailSenderService {

    private final MailService mailService;

    public MailSenderService(MailService mailService) {
        this.mailService = mailService;
    }


    public void sendException(String details, String path, HttpSession session, HttpServletRequest request, Model model,Exception exception) {

        User user= (User) session.getAttribute("logged_user");
        String user_details;
        if(user==null){
            user_details="User is Unknown or Null";
        }
        else{
            user_details=user.getEmail()+"\n"+user.getFirstname()+" "+user.getLastname()+"\n"+session.getAttribute("os")+"\n";
        }
        String message=
                "Application error...!!!\n"+
                        "At Path "+path+"\n"+
                        "Details "+details+"\n"+
                        "User "+user_details+"\n"+
                        "Time: " + LocalDateTime.now() + "\n"+
                        "Method: " + request.getMethod() + "\n"+
                        "Path: " + request.getRequestURI() + "\n"+
                        "IP: " + request.getRemoteAddr() + "\n"+
                        " Error Info\n" +
                        "HTTP Status: "+model.getAttribute("status")+"\n" +
                        "Exception: " + exception.getClass().getName() + "\n" +
                        "Message: " + exception.getMessage() + "\n"
                ;

        mailService.send("🚨 eDonorNet Error Alert",message);
    }
}
