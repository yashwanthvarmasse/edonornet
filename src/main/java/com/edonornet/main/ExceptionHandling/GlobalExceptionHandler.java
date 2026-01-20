package com.edonornet.main.ExceptionHandling;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(Exception.class)
    public String handler(Exception exception, Model model, HttpServletRequest request){
        model.addAttribute("message","Internal issue is faced");
        model.addAttribute("details", exception.getMessage());
        model.addAttribute("message",request.getRequestURI());

        return "error";

    }
}
