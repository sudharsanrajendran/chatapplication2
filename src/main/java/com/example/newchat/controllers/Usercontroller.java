package com.example.newchat.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.newchat.Utils.JwtGeneration;
import com.example.newchat.database.User;
import com.example.newchat.repository.Userrepositroy;
import com.example.newchat.services.Userservice;

import jakarta.servlet.http.HttpServletRequest;


@RestController
public class Usercontroller {

    @Autowired
    Userservice userservice;
@Autowired
    Userrepositroy userrepo;
     @Autowired 
    JwtGeneration jwtGeneration;

 @GetMapping("/all")
public ResponseEntity<List<User>> getAllUsers() {
    List<User> data = userservice.getalluser();
    return ResponseEntity.ok(data);  // Automatically serialized to JSON
}

@GetMapping("/fetchusers")
public ResponseEntity<List<User>> getAllUsers(HttpServletRequest request) {
    // 1. Get JWT token from header
    String token = request.getHeader("Authorization");
    if (token != null && token.startsWith("Bearer ")) {
        token = token.substring(7); // remove "Bearer " prefix
    }

    // 2. Extract email from token
    String email = jwtGeneration.ExtractUsername(token); // Assuming subject=email

    // 3. Get logged-in user
    Optional<User> currentUser = userrepo.findByEmail(email);
    if (currentUser.isEmpty()) {
        return ResponseEntity.status(401).build(); // unauthorized
    }

    // 4. Fetch all users and exclude current one
    List<User> users = userservice.getalluser().stream()
        .filter(user -> !user.getId().equals(currentUser.get().getId()))
        .toList();

    return ResponseEntity.ok(users);
}


}
