package com.example.newchat.Dto;

public class histroyDto {

    private Long senderId; // 👈 Add senderId
    private String messageContent;
    public histroyDto(Long senderId, String messageContent) {
        this.senderId = senderId;
        this.messageContent = messageContent;
    }
    public Long getSenderId() {
        return senderId;
    }
    public void setSenderId(Long senderId) {
        this.senderId = senderId;
    }
    public String getMessageContent() {
        return messageContent;
    }
    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }


}
