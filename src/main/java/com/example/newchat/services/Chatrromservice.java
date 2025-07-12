package com.example.newchat.services;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.newchat.database.ChatRoomRequest;
import com.example.newchat.database.User;
import com.example.newchat.repository.Chatroomrepositroy;
import com.example.newchat.repository.Userrepositroy;


@Service
public class Chatrromservice {
    @Autowired
    Chatroomrepositroy chatrepo;
    @Autowired 
    Userrepositroy userrepo;
  
Optional<ChatRoomRequest>Checkchatuserexistornot(User id1,User id2){

Optional<ChatRoomRequest> roomexist=chatrepo.findBySenderAndReceiver(id1,id2);
if(roomexist.isPresent()){
    return roomexist;
}
 roomexist=chatrepo.findBySenderAndReceiver(id2,id1);
 if(roomexist.isPresent()){
    return roomexist;
}
 return roomexist;

}


public ChatRoomRequest GetOrCreateChatroom(Long senderid,long receiverid){

    User sender=userrepo.findById(senderid).orElseThrow();
    User recever= userrepo.findById(receiverid).orElseThrow();
    Optional<ChatRoomRequest>existingroom=Checkchatuserexistornot(sender,recever);
if (existingroom.isPresent()) {
            System.out.println("🔁 Returning existing ChatRoom with ID: " + existingroom.get().getChatroomid());
            return existingroom.get();
        }  
        ChatRoomRequest newroom = new ChatRoomRequest();
        newroom.setSender(sender);
        newroom.setReceiver(recever);
        ChatRoomRequest savedrom=chatrepo.save(newroom);
           System.out.println("🆕 ChatRoom created with ID: " + savedrom.getChatroomid());
            return savedrom;



}





}
