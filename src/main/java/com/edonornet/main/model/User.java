package com.edonornet.main.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    private String firstname;
    private String lastname;
    private String password;
    private String blood;
    private LocalDate dob;
    private Long phone;
    private int no_of_donations = 0;
    private int no_of_receivings = 0;
    private String gender;

}
