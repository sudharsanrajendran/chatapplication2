package com.example.newchat.services;

import com.google.firebase.messaging.*;
import org.springframework.stereotype.Service;

@Service
public class FCMService {

    public String sendTopicNotification(String topic, String title, String body) throws FirebaseMessagingException {
        Notification notification = Notification.builder()
                .setTitle(title)
                .setBody(body)
                .build();

        Message message = Message.builder()
                .setTopic(topic)
                .setNotification(notification)
                .putData("title", title)
                .putData("body", body)
                .putData("click_action", "FLUTTER_NOTIFICATION_CLICK")
                .build();

        return FirebaseMessaging.getInstance().send(message);
    }
}




