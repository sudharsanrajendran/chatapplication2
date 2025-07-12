package com.example.newchat.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.newchat.Dto.histroyDto;
import com.example.newchat.database.Message;
import com.example.newchat.repository.Messagerepository;

@RestController
public class Messagecontroller {

    @Autowired
    Messagerepository messagerepository;
  //  @GetMapping("history/{roomId}")
public ResponseEntity<List<Message>> getChatHistory1(@PathVariable Long roomId) {
    List<Message> history = messagerepository.findByChatroomid_Chatroomid(roomId);
    return ResponseEntity.ok(history);
}


@GetMapping("history/{roomId}")
public ResponseEntity<List<histroyDto>> getChatHistory(@PathVariable Long roomId) {
    List<histroyDto> dtos = messagerepository
        .findByChatroomid_Chatroomid(roomId)
        .stream()
        .map(msg -> new histroyDto(msg.getSender().getId(),msg.getMessageContent()))
        .toList();

    return ResponseEntity.ok(dtos);
}
}
