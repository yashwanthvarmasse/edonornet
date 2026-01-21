package com.edonornet.main.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailService {

    private final JavaMailSender mailSender;

    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void send(String subject, String body) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("yashwanthvarma.sse@gmail.com");
        message.setTo("yashwanth.sse@gmail.com");
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }
}
