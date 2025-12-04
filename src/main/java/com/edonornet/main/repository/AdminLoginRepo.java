package com.edonornet.main.repository;


import com.edonornet.main.model.Admin_Login_info;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminLoginRepo extends JpaRepository<Admin_Login_info,Long> {

}
