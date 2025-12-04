package com.edonornet.main.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Donars_info")
@Setter
@Getter
@NoArgsConstructor
public class Donor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;
    private String email;
    private Long phone;
    private String dob;
    private String bloodGroup;
    private String city;
    private String state;
    private int weight;
    private String gender;
    private double hemoglobin;
    private String bloodPressure;
    private int pulse;
    private int temperature;
    private String goodHealth;
    private String tattoo;
    private String sick;
    private String travel;
    private String medications;
    private String disease;
//    private String reportUpload;
    private List<String> availability;
    private String reason;
    private String status;
    private int volume;
    private LocalDate date;
    private LocalDate donatedDate;
    private LocalDate approvedDate=LocalDate.now();
    private String HospitalName;

}
