package com.example.newchat.controllers;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.newchat.Dto.chatroomDto;
import com.example.newchat.database.ChatRoomRequest;
import com.example.newchat.database.User;
import com.example.newchat.repository.Chatroomrepositroy;
import com.example.newchat.repository.Userrepositroy;
import com.example.newchat.services.Chatrromservice;

@RestController
public class Chatroomcontroller {

    @Autowired 
    Userrepositroy userrepositroy;

    @Autowired
    Chatroomrepositroy chatrepo;

    @Autowired
    Chatrromservice chatrromservice;


@PostMapping("/chatroom")
ResponseEntity<?>postrromid(@RequestBody chatroomDto request){
User sender = userrepositroy.findById(request.getUser1()).orElseThrow();
User recever = userrepositroy.findById(request.getUser2()).orElseThrow();

ChatRoomRequest chatRoom =chatrromservice.GetOrCreateChatroom(sender.getId(),recever.getId());

        return ResponseEntity.ok(Map.of("Id", chatRoom.getChatroomid()));


}


}

