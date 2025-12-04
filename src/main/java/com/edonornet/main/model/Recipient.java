package com.edonornet.main.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table
@Getter
@Setter
public class Recipient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    private String email;
    private String patientName;
    private int patientAge;
    private String bloodGroup;
    private int units;
    private String request_reason;
    private String hospitalName;
    private String hospitalCity;
    private String state;
    private String attendantName;
    private Long attendantPhone;
    private String doctorName;
//    private String prescriptionUpload;
    private LocalDate date;
    private LocalDate recivedDate;
    private String status;
    private String reason;

}
