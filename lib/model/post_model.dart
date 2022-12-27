
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? id;
  String? email;
  String? fname;

  String? phoneNumber;
  String? imageUrl;
 
  bool isAdmin=false;
  //bool? isMale;
  AppUser(
      [this.id,
      this.email,
      this.fname,
     
      this.phoneNumber,
      this.isAdmin=false,

      this.imageUrl]);
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fname': fname,
  
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      
      'imageUrl': imageUrl,
    };
  }

  AppUser.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    fname = map['fname'];

    phoneNumber = map['phoneNumber'];
    isAdmin = map['isAdmin'];
    imageUrl = map['imageUrl'];
 
  }

}
class DataChat {
   String? sender;
   String? text;
   Timestamp? time;
   bool? isMe;
  DataChat({
    this.sender,
    this.text,
    this.time,
    this.isMe
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(sender != null){
      result.addAll({'sender': sender});
    }
    if(text != null){
      result.addAll({'text': text});
    }
    if(time != null){
      result.addAll({'time': time!.toString()});
    }
     if(isMe != null){
      result.addAll({'sender': sender});
    }
  
    return result;
  }

  factory DataChat.fromMap(Map<String, dynamic> map) {
    return DataChat(
      sender: map['sender'],
      text: map['text'],
      time: map['time'],
      isMe: map['isMe'],


    
    );
  }

  String toJson() => json.encode(toMap());

  factory DataChat.fromJson(String source) => DataChat.fromMap(json.decode(source));
}
