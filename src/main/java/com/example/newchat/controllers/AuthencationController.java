package com.example.newchat.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.example.newchat.models.Loginmodel;
import com.example.newchat.models.RegisterModel;
import com.example.newchat.repository.Userrepositroy;
import com.example.newchat.services.Authservice;




@RestController
public class AuthencationController {

    @Autowired
    Userrepositroy userrepositroy;
    @Autowired
    Authservice authservice;
    

    @PostMapping("/login")
    public  ResponseEntity<Map<String, Object>> Login(@RequestBody Loginmodel register ) {
       Map<String,Object>response= new HashMap<>();
        try {
        String token=authservice.login(register.getEmail(), register.getPassword());
         long userId=authservice.getUserIdbyEmail(register.getEmail());
        response.put("success","login sucessfully");
         response.put("Userid", String.valueOf(userId));
        response.put("token", token);
        return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("Error with login", "deciend login");
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String,Object>> Register(@RequestBody RegisterModel register) 
    {
         Map<String,Object>response= new HashMap<>();
        try {
              String message=authservice.register(register);
           response.put("success",message);
           return ResponseEntity.ok(response);
          
        }catch(Exception e){
            response.put("error","resgiter failed"+e);
            return ResponseEntity.status(401).body(response);
        }
    }
    
    
    

}
