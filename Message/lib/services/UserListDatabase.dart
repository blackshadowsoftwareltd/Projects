import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserListDatabase {
  final CollectionReference friendListRef =
      FirebaseFirestore.instance.collection('UsersInFo');

  getUserByUserName(String userName) async {
    return await Firestore.instance
        .collection('UsersInFo')
        .where('userName', isEqualTo: userName)
        .getDocuments();
  }

  getFriendList() async {
    return await friendListRef.get();
  }

  ChatRoom(String roomId, roomMap) {
    FirebaseFirestore.instance
        .collection('ChatsRoom')
        .document(roomId)
        .setData(roomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getConversationMessage(String chatRoomId, messageMap) {
    Firestore.instance
        .collection('ChatsRoom')
        .document(chatRoomId)
        .collection('Chats')
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getRecentMessage(String chatRoomId) async{
 return  await Firestore.instance
        .collection('ChatsRoom')
        .document(chatRoomId)
        .collection('Chats')
        .snapshots();
  }
}
