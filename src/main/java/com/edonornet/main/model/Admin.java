package com.edonornet.main.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Admins")
@Setter
@Getter
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String orgId;
    String name;
    String email;
    String password;
    String role;
    String status="Inactive";

}
