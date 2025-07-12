package com.example.newchat.Dto;

public class messageDTO {

    
    long chatroomID;
    String messageContent;
    long senderId;
    long receverID;
    public long getChatroomID() {
        return chatroomID;
    }
    public void setChatroomID(long chatroomID) {
        this.chatroomID = chatroomID;
    }
    public String getMessageContent() {
        return messageContent;
    }
    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }
    public long getSenderId() {
        return senderId;
    }
    public void setSenderId(long senderId) {
        this.senderId = senderId;
    }
    public long getReceverID() {
        return receverID;
    }
    public void setReceverID(long receverID) {
        this.receverID = receverID;
    }
}
