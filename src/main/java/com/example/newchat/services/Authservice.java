package com.example.newchat.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.newchat.repository.Userrepositroy;
import com.example.newchat.Utils.JwtGeneration;
import com.example.newchat.database.User;
import com.example.newchat.models.*;


@Service
public class Authservice {

 @Autowired private AuthenticationManager authManager;
 @Autowired Userrepositroy userrepositroy;
 @Autowired JwtGeneration jwt;
@Autowired
  private PasswordEncoder passwordEncoder;
 

  public String login(String email,String password){
    
    authManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));
    return jwt.tokengenerator(email);
  }

  public String register(RegisterModel register )
  {

    if(userrepositroy.findByEmail(register.getEmail()).isPresent()){
        return "Email already exists";
    }
        User user = new User();
        user.setEmail(register.getEmail());
        user.setUsername(register.getUsername());
        String encrptedpassword=passwordEncoder.encode(register.getPassword());
        user.setPassword(encrptedpassword);
        userrepositroy.save(user);
    return "Register successfully";
  }


  public Long getUserIdbyEmail(String Email){
    User user= userrepositroy.findByEmail(Email).orElseThrow(()->new UsernameNotFoundException("Invaild Email"));
    return user.getId();
  }


}
