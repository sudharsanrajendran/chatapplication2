package com.example.newchat.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.newchat.database.User;



@Repository
public interface Userrepositroy extends JpaRepository<User,Long>
{
Optional<User>findByEmail(String email);
User findById(User id);
}
