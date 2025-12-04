package com.edonornet.main.service;


import com.edonornet.main.model.Admin;
import com.edonornet.main.model.Admin_Login_info;
import com.edonornet.main.repository.AdminLoginRepo;
import com.edonornet.main.repository.AdminRepo;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    private final AdminRepo adminRepo;
    private final AdminLoginRepo adminLoginRepo;
    public final PasswordEncoder passwordEncoder;
    public AdminService(AdminRepo adminRepo,AdminLoginRepo adminLoginRepo,PasswordEncoder passwordEncoder){
        this.adminRepo=adminRepo;
        this.adminLoginRepo=adminLoginRepo;
        this.passwordEncoder=passwordEncoder;
    }

    public Admin findUser(String orgId, String pass){
        Admin admin=find(orgId);
        if(passwordEncoder.matches(pass,admin.getPassword())) return admin;
        else return null;
    }

    public Admin find(String orgId){
        return adminRepo.findByOrgId(orgId);
    }

    public boolean findadmin(String orgId){
        return adminRepo.existsByOrgId(orgId);
    }
    public boolean findadminByEmail(String email){
        return adminRepo.existsByEmail(email);
    }

    public void save(Admin admin){
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));
        adminRepo.save(admin);
    }

    public void saveinfo(Admin_Login_info admin){
        adminLoginRepo.save(admin);
    }


}
