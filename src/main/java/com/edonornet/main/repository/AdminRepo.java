package com.edonornet.main.repository;

import com.edonornet.main.model.Admin;
import com.edonornet.main.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepo extends JpaRepository<Admin,Long> {

    Admin findByOrgId(String orgId);

    boolean existsByOrgId (String orgId);

    boolean existsByEmail(String email);

}
