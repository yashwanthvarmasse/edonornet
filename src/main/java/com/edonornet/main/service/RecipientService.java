package com.edonornet.main.service;

import com.edonornet.main.model.Donor;
import com.edonornet.main.model.Recipient;
import com.edonornet.main.repository.RecipientRepo;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class RecipientService {
    public final RecipientRepo recipientRepo;
    public RecipientService(RecipientRepo recipientRepo){
        this.recipientRepo=recipientRepo;
    }

    public void save(Recipient recipient){
        recipientRepo.save(recipient);
    }

    public List<Recipient> findRecipient(String email){
        List<Recipient> requests=recipientRepo.findByEmail(email);
        return requests==null? Collections.emptyList():requests;
    }

    public Recipient findById(Long Id){
        return recipientRepo.findById(Id).orElse(null);
    }

    public List<Recipient> findAll(){
        List<Recipient> requests = recipientRepo.findAll();
        return requests==null? Collections.emptyList():requests;
    }

    
}
