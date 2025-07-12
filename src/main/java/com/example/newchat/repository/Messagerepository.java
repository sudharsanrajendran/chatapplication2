package com.example.newchat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.newchat.database.Message;


@Repository
public interface Messagerepository  extends JpaRepository<Message,Long>{
    List<Message> findByChatroomid_Chatroomid(Long chatroomId);
}
