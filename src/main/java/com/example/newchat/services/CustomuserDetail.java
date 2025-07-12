package com.example.newchat.services;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.newchat.database.User;
import com.example.newchat.repository.Userrepositroy;

@Service
public class CustomuserDetail implements UserDetailsService {

    @Autowired 
    Userrepositroy userrepositroy;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      User user=  userrepositroy.findByEmail(username).orElseThrow( ()->
        new UsernameNotFoundException(username));

        return new org.springframework.security.core.userdetails.User(user.getEmail(),
        user.getPassword(),new ArrayList<>());
    }
    



}
