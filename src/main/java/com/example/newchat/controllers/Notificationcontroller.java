package com.example.newchat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.example.newchat.Dto.NotificationDto;
import com.example.newchat.services.FCMService;

@RestController
public class Notificationcontroller {

    @Autowired
    private FCMService fcmService;

    @PostMapping("/send-topic")
    public ResponseEntity<String> sendNotification(@RequestBody NotificationDto request) {
        try {
            String response = fcmService.sendTopicNotification(request.getTopic(), request.getTitle(), request.getBody());
            return ResponseEntity.ok("Notification sent: " + response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
}

