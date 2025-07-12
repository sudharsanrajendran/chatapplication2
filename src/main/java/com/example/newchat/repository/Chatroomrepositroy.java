package com.example.newchat.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.newchat.database.ChatRoomRequest;
import com.example.newchat.database.User;

@Repository
public interface Chatroomrepositroy extends JpaRepository<ChatRoomRequest, Long>
{
    Optional<ChatRoomRequest>findBySenderAndReceiver(User sender,User receiver);
   

}
