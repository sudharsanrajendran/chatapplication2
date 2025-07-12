package com.example.newchat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.example.newchat.Utils.AuthencationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
AuthencationFilter auth;

@Bean
public SecurityFilterChain filterChain(HttpSecurity http)throws Exception{
http.csrf(csrf->csrf.disable()).
authorizeHttpRequests(request->request.requestMatchers("/login", "/register", "/fetchusers","/chatroom","/all", "/ws/**","/history/**", "/queue/**").permitAll().
anyRequest().
authenticated()).
sessionManagement(management->management.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
http.addFilterBefore(auth,UsernamePasswordAuthenticationFilter.class);
return http.build(); 
}


@Bean
public AuthenticationManager authManager(AuthenticationConfiguration configuration)throws Exception{
    return configuration.getAuthenticationManager();
}

@Bean
public PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
}

}
