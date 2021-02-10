import 'package:Massage/screen/conversation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConversationHistory extends StatefulWidget {
  final String userName, userMail;

  ConversationHistory({this.userMail, this.userName});

  @override
  _ConversationHistoryState createState() => _ConversationHistoryState();
}

class _ConversationHistoryState extends State<ConversationHistory> {
  String userId;

  @override
  Widget build(BuildContext context) {
    userId = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Chats').snapshots(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
                reverse: true,
                padding: EdgeInsets.all(10),
                children:
                    snapShot.data.docs.map((DocumentSnapshot documentSnapshot) {
                  return userId == documentSnapshot.data()['sender'] ||
                          userId == documentSnapshot.data()['receiver']
                      ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                    spreadRadius: 2)
                              ]),
                          child: FlatButton(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  userId ==
                                                          documentSnapshot
                                                              .data()['sender']
                                                      ? documentSnapshot.data()[
                                                          'receiverName']
                                                      : documentSnapshot
                                                          .data()['senderName'],
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                child: Text(
                                                    documentSnapshot
                                                        .data()['text'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: userId ==
                                                                documentSnapshot
                                                                        .data()[
                                                                    'sender']
                                                            ? Colors.grey[500]
                                                            : Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )
                                            ]))
                                  ]),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConversationPage(
                                          userId: userId,
                                          userName: widget.userName,
                                          FUserId: userId ==
                                                  documentSnapshot
                                                      .data()['sender']
                                              ? documentSnapshot
                                                  .data()['receiver']
                                              : documentSnapshot
                                                  .data()['sender'],
                                          FName: userId == documentSnapshot.data()['sender']
                                              ? documentSnapshot
                                                  .data()['receiverName']
                                              : documentSnapshot
                                                  .data()['senderName'])))))
                      : Container();
                }).toList());
          }
          return null;
        });
  }
}
