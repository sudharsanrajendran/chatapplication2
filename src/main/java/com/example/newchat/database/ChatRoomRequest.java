package com.example.newchat.database;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class ChatRoomRequest {
    @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long chatroomid;
    @ManyToOne
@JoinColumn(name = "sender_id")
private User sender;

@ManyToOne
@JoinColumn(name = "receiver_id")
private User receiver;

public ChatRoomRequest(Long chatroomid, User sender, User receiver) {
    this.chatroomid = chatroomid;
    this.sender = sender;
    this.receiver = receiver;
}

public ChatRoomRequest() {
}

public Long getChatroomid() {
    return chatroomid;
}

public void setChatroomid(Long chatroomid) {
    this.chatroomid = chatroomid;
}

public User getSender() {
    return sender;
}

public void setSender(User sender) {
    this.sender = sender;
}

public User getReceiver() {
    return receiver;
}

public void setReceiver(User receiver) {
    this.receiver = receiver;
}

   
    }


