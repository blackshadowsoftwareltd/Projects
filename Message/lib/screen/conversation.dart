import 'package:Massage/services/UserListDatabase.dart';
import 'package:Massage/widget/MessageContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  final String FUserId, userId, FName, userName;

  ConversationPage({this.FUserId, this.userId, this.FName, this.userName});

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController sendSmsTextEditingController;
  UserListDatabase userListDatabase = UserListDatabase();
  String txt = '', sender, receiver;

  Stream recentMessageStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isSender = false;

  @override
  Widget build(BuildContext context) {
    print(widget.FUserId);
    print(widget.FName);
    print(widget.userId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text(widget.FName), backgroundColor: Colors.green[300]),
      body: Container(
        child: Stack(
          children: [
            MessagesList(context),
            Container(
              alignment: Alignment.bottomCenter,
              child: _senderBody(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _senderBody(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green[300], borderRadius: BorderRadius.circular(50)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width - 120,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: sendSmsTextEditingController,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                        hintText: 'Enter your Message',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                        border: InputBorder.none),
                    onChanged: (value) {
                      txt = value;
                      setState(() {
                        sendSmsTextEditingController.clear();
                      });
                    },
                  )),
              IconButton(
                  icon:
                      Icon(Icons.send_outlined, size: 30, color: Colors.white),
                  onPressed: () {
                    TimeOfDay timeOfDay = TimeOfDay.now();
                    String _currentTime = timeOfDay.format(context);
                    _Sending(txt, _currentTime);
                  })
            ]));
  }

  _Sending(String txt, String _currentTime) {
    var _docTime = DateTime.now();
    if (txt != null)
      FirebaseFirestore.instance
          .collection('Chats')
          .doc(_docTime.toString())
          .set({
        'text': txt,
        'sender': widget.userId,
        'receiver': widget.FUserId,
        'time': _currentTime,
        'receiverName': widget.FName,
        'senderName': widget.userName
      });
  }

  Widget MessagesList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Chats').snapshots(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                  padding: EdgeInsets.all(10),
                  children: snapShot.data.docs
                      .map((DocumentSnapshot documentSnapshot) {
                    return widget.userId ==
                                    documentSnapshot.data()['receiver'] &&
                                widget.FUserId ==
                                    documentSnapshot.data()['sender'] ||
                            widget.userId ==
                                    documentSnapshot.data()['sender'] &&
                                widget.FUserId ==
                                    documentSnapshot.data()['receiver']
                        ? MessagesContainers(
                            text: documentSnapshot.data()['text'],
                            time: documentSnapshot.data()['time'],
                            FuserId: widget.FUserId,
                            sender: documentSnapshot.data()['sender'])
                        : Container();
                  }).toList());
            }
            return null;
          }),
    );
  }
}
