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


    public void sendException(String details, String path, HttpSession session, Model model) {

        User user= (User) session.getAttribute("logged_user");
        String user_details;
        if(user==null){
            user_details="User is Unknown or Null";
        }
        else{
            user_details=user.getEmail()+"\n"+user.getFirstname()+" "+user.getLastname()+"\n"+session.getAttribute("os")+"\n";
        }
        String message =
                "<html>" +
                        "<body style='font-family: Arial, sans-serif; line-height: 1.6; color: #333;'>" +
                        "    <div style='max-width: 600px; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px; overflow: hidden;'>" +
                        "        <div style='background-color: #d9534f; color: white; padding: 15px; text-align: center;'>" +
                        "            <h2 style='margin: 0;'>🚨 Application Error Alert</h2>" +
                        "        </div>" +
                        "        <div style='padding: 20px;'>" +
                        "            <p style='font-size: 16px; color: #d9534f;'><strong>A critical error occurred in eDonorNet.</strong></p>" +
                        "            <table style='width: 100%; border-collapse: collapse;'>" +
                        "                <tr><td style='padding: 8px; border-bottom: 1px solid #eee;'><strong>Time:</strong></td><td style='padding: 8px; border-bottom: 1px solid #eee;'>" + LocalDateTime.now() + "</td></tr>" +
                        "                <tr><td style='padding: 8px; border-bottom: 1px solid #eee;'><strong>HTTP Status:</strong></td><td style='padding: 8px; border-bottom: 1px solid #eee;'>" + model.getAttribute("status") + "</td></tr>" +
                        "                <tr><td style='padding: 8px; border-bottom: 1px solid #eee;'><strong>Path:</strong></td><td style='padding: 8px; border-bottom: 1px solid #eee;'>" + path + "</td></tr>" +
                        "                <tr><td style='padding: 8px; border-bottom: 1px solid #eee;'><strong>User Details:</strong></td><td style='padding: 8px; border-bottom: 1px solid #eee;'>" + user_details.replace("\n", "<br>") + "</td></tr>" +
                        "            </table>" +
                        "            <div style='margin-top: 20px; background: #f9f9f9; padding: 15px; border-left: 4px solid #d9534f;'>" +
                        "                <strong>Error Details:</strong><br>" +
                        "                <code style='font-family: monospace;'>" + details + "</code>" +
                        "            </div>" +
                        "        </div>" +
                        "        <div style='background-color: #f4f4f4; color: #777; padding: 10px; text-align: center; font-size: 12px;'>" +
                        "            eDonorNet Monitoring System | Sent from Spring Boot" +
                        "        </div>" +
                        "    </div>" +
                        "</body>" +
                        "</html>";

        mailService.send("🚨 eDonorNet Error Alert", message);
    }
}
