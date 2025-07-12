package com.example.newchat.database;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {
@Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;
  String email;
  String password;
  String username;
  public User(Long id, String email, String password, String username) {
    this.id = id;
    this.email = email;
    this.password = password;
    this.username = username;
  }

  public String getUsername() {
    return username;
}
  public void setUsername(String username) {
    this.username = username;
  }
  public User() {
}
  
  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
}
