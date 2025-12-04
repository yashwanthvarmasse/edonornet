package com.edonornet.main.configurations;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class HttpConfig {

    //csrf is enalbed by default so no need to configure
//    @Bean
//     public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(auth-> auth
//                        .requestMatchers("/","/signin","/signup","/donation_info","/recipient_info","/webapp/**","/static/**","/js/**").permitAll()
//                        .requestMatchers("/user/**").hasRole("USER")
//                        .requestMatchers("/admin/**").hasRole("ADMIN")
//                        .anyRequest().authenticated()
//                )
//                .formLogin(form->form
//                        .loginPage("/signin")
//                        .loginProcessingUrl("/validate_user")
//                        .defaultSuccessUrl("/user/dashboard")
//                        .permitAll()
//                )
//                .logout(logout->logout
//                        .logoutUrl("/user/logout")
//                        .logoutSuccessUrl("/")
//                        .invalidateHttpSession(true)
//                        .deleteCookies("JSESSIONID")
//                        .permitAll()
//                )
//                .sessionManagement(session->session
//                        .sessionFixation().migrateSession()
//                )
//                .csrf(csrf->csrf.disable());
//                return http.build();
//     }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(14);
    }

}