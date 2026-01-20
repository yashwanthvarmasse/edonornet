package com.edonornet.main.service;


import com.edonornet.main.model.User;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service
public class WhatsappReporting {


    public void sendException(String details, String path, HttpSession session) {

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
                        "At Path"+path+"\n"+
                        "Details "+details+"\n"+
                        "User"+user_details+"\n";
    }
}
