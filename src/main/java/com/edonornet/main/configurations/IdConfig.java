package com.edonornet.main.configurations;

import org.springframework.context.annotation.Configuration;

import java.util.UUID;

@Configuration
public class IdConfig {


    public static String generateId(String categoryPrefix) {
        String uuidPart = UUID.randomUUID().toString().substring(0, 6).toUpperCase();
        return categoryPrefix + "-" + uuidPart;
    }

}
