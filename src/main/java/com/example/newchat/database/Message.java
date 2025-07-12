package com.example.newchat.database;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Message {
    @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
    long msgId;
@ManyToOne
@JoinColumn(name = "sender_id")
private User sender;

@ManyToOne
@JoinColumn(name = "receiver_id")
private User receiver;
@ManyToOne
@JoinColumn(name = "chatroom_id")
private ChatRoomRequest chatroomid;

    private String messageContent;

    private LocalDateTime timestamp;

    public Message() {
    }

    public Message(long msgId, User sender, User receiver, ChatRoomRequest chatroomid, String messageContent,
            LocalDateTime timestamp) {
        this.msgId = msgId;
        this.sender = sender;
        this.receiver = receiver;
        this.chatroomid = chatroomid;
        this.messageContent = messageContent;
        this.timestamp = timestamp;
    }

    public long getMsgId() {
        return msgId;
    }

    public void setMsgId(long msgId) {
        this.msgId = msgId;
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

    public ChatRoomRequest getChatroomid() {
        return chatroomid;
    }

    public void setChatroomid(ChatRoomRequest chatroomid) {
        this.chatroomid = chatroomid;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
}
