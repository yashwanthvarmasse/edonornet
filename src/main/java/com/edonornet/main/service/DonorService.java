package com.edonornet.main.service;

import com.edonornet.main.configurations.HttpConfig;
import com.edonornet.main.model.Donor;
import com.edonornet.main.repository.DonorRepo;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DonorService {

    public final DonorRepo donorRepo;

    public DonorService(DonorRepo donorRepo){
        this.donorRepo=donorRepo;
    }

    public void save(Donor donor){
        donorRepo.save(donor);
    }

    public List<Donor> findDonor(String email){
        List<Donor> donations = donorRepo.findByEmail(email);
        return donations==null? Collections.emptyList():donations;
    }

    public Donor findById(Long Id){
        return donorRepo.findById(Id).orElse(null);
    }

    public List<Donor> findAll(){
        List<Donor> donations = donorRepo.findAll();
        return donations==null? Collections.emptyList():donations;
    }

}
