package com.edonornet.main.controller;


import com.edonornet.main.configurations.IdConfig;
import com.edonornet.main.model.Admin;
import com.edonornet.main.model.Admin_Login_info;
import com.edonornet.main.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminAccessController {

    private final AdminService adminService;

    public AdminAccessController(AdminService adminService){
        this.adminService=adminService;
    }

    @PostMapping("/validate_admin")
    public String validating_admin(String orgId, String password, HttpSession session,Model model) {
        model.addAttribute("orgId",orgId);
        Admin_Login_info adminLoginInfo = new Admin_Login_info();
        Admin admin = adminService.find(orgId);
        if (admin == null) {
            adminLoginInfo.setStatus("Failed");
            adminLoginInfo.setOrgId(orgId);
            adminLoginInfo.setReason("User not found in the Database");
            adminService.saveinfo(adminLoginInfo);
            return "admin/access-denied";
        } else {
            Admin admin1 = adminService.findUser(orgId, password);
            if (admin1 == null) {
                adminLoginInfo.setStatus("Failed");
                adminLoginInfo.setOrgId(orgId);
                adminLoginInfo.setReason("Incorrect Password");
                adminService.saveinfo(adminLoginInfo);
                return "admin/password-incorrect";
            } else {
                adminLoginInfo.setStatus("Successfull");
                adminLoginInfo.setOrgId(orgId);
                adminLoginInfo.setRole(admin1.getRole());
                adminLoginInfo.setName((admin1.getName()));
                adminService.saveinfo(adminLoginInfo);
                session.setAttribute("logged_admin", admin1);
                return "redirect:/admin/dashboard";
            }
        }
    }

    @PostMapping("/create_admin")
    public String create_admin(@ModelAttribute Admin admin, Model model){

        String prefix;
        String id=null;

        if(adminService.findadminByEmail(admin.getEmail())){
            model.addAttribute("email",admin.getEmail());
            return "admin/already-exist";
        }
        else{
            String org=admin.getRole();
            if(org.equals("system_admin")){
                prefix="SA";
            }
            else if(org.equals("organization_admin")){
                prefix="OA";
            }
            else{
                prefix="BBA";
            }

            while(((adminService.findadmin(id)))||(id==null)){
                id= IdConfig.generateId(prefix);
            }

            admin.setOrgId(id);
            adminService.save(admin);
            return "redirect:/admin/login";
        }

    }

}
