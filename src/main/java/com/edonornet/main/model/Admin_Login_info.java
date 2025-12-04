package com.edonornet.main.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Setter
@Getter
public class Admin_Login_info {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    String os=System.getProperty("os.name");
    String version=System.getProperty("os.version");
    String architecture=System.getProperty("os.arch");
    String java_version=System.getProperty("java.version");
    String system_user_name=System.getProperty("user.name");
    String name="Not found";
    String status;
    String reason="User Found";
    String role="Not found";
    String orgId;

}
