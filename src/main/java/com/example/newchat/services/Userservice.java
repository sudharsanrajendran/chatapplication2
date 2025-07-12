package com.example.newchat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.newchat.database.User;
import com.example.newchat.repository.Userrepositroy;

@Service
public class Userservice {
    @Autowired 
    Userrepositroy userrepositroy;
     
   public List<User>getalluser(){
        return userrepositroy.findAll();
    }


}
