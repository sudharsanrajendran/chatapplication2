package com.example.newchat.services;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.newchat.Dto.messageDTO;
import com.example.newchat.database.ChatRoomRequest;
import com.example.newchat.database.Message;
import com.example.newchat.database.User;
import com.example.newchat.repository.Chatroomrepositroy;
import com.example.newchat.repository.Messagerepository;
import com.example.newchat.repository.Userrepositroy;

@Service
public class Chatservice {

@Autowired Chatrromservice chatrromservice;
@Autowired Chatroomrepositroy chatrepo;
@Autowired Userrepositroy userepo;
@Autowired Messagerepository messagerepo;
@Autowired
private FCMService fcmService;


public void savemessage(messageDTO msg) {

    Optional<User> senderOpt = userepo.findById(msg.getSenderId());
    Optional<User> receiverOpt = userepo.findById(msg.getReceverID());

    if (senderOpt.isEmpty()) {
        System.err.println("❌ Sender not found: ID = " + msg.getSenderId());
        return;
    }

    if (receiverOpt.isEmpty()) {
        System.err.println("❌ Receiver not found: ID = " + msg.getReceverID());
        return;
    }

    User senderid = senderOpt.get();
    User receverid = receiverOpt.get();

    Optional<ChatRoomRequest> existingroom = chatrromservice.Checkchatuserexistornot(senderid, receverid);

    ChatRoomRequest chatroom = existingroom.orElseGet(() -> {
        ChatRoomRequest newroom = new ChatRoomRequest();
        newroom.setSender(senderid);
        newroom.setReceiver(receverid);
        ChatRoomRequest savedrom = chatrepo.save(newroom);
        System.out.println("🆕 ChatRoom created with ID: " + savedrom.getChatroomid());
        return savedrom;
    });

    Message message = new Message();
    message.setChatroomid(chatroom);
    message.setSender(senderid);
    message.setReceiver(receverid);
    message.setMessageContent(msg.getMessageContent());
    message.setTimestamp(LocalDateTime.now());

    Message savedMessage = messagerepo.save(message);
      // 🔔 Send push notification
    try {
        String title = "New message from " + senderid.getUsername();
        String body = msg.getMessageContent();
        String topic = "user-" + receverid;  // 👈 Your topic logic

        fcmService.sendTopicNotification(topic, title, body);
        System.out.println("✅ Push notification sent to: " + topic);
    } catch (Exception e) {
        System.err.println("❌ Failed to send push notification: " + e.getMessage());
    }

    System.out.println("📤 Message sent successfully!");
    System.out.println("   ➤ ChatRoom ID: " + chatroom.getChatroomid());
    System.out.println("   ➤ From: " + senderid.getUsername());
    System.out.println("   ➤ To: " + receverid.getUsername());
    System.out.println("   ➤ Message: " + savedMessage.getMessageContent());
    System.out.println("   ➤ Timestamp: " + savedMessage.getTimestamp());
}

}
