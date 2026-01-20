package com.edonornet.main.ExceptionHandling;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(Exception.class)
    public String handler(Exception exception, Model model, HttpServletRequest request){
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
        int statusCode = status.value();
        model.addAttribute("message","Internal issue is faced");
        model.addAttribute("details", exception.getMessage());
        model.addAttribute("path",request.getRequestURI());
        model.addAttribute("status",statusCode);

        return "error";

    }
}
