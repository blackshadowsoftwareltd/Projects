import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controller/user_controller.dart';

class DataInsertScreen extends StatelessWidget {
  String? name;
  int? age;
  final controller = Get.put(UsersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Insert Screen')),
      body: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    placeholder: 'Name',
                    onChanged: (text) => name = text)),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    placeholder: 'Age',
                    keyboardType: TextInputType.number,
                    onChanged: (text) => age = int.parse(text))),
            Container(
                child: CupertinoButton(
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text('Add')),
                    onPressed: () {
                      if (name != null && name!.isNotEmpty && age != null)
                        controller.setUser(name!, age!);
                    })),
            Expanded(
                child: GetX<UsersController>(
                    builder: (controller) => ListView.builder(
                        itemCount: controller.userList.length,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.green.shade100,
                            padding: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Name : ${controller.userList[index].name}'),
                                  Text(
                                      'Age : ${controller.userList[index].age}')
                                ]))))),
            Container(
                color: Colors.red.shade100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: GetX<UsersController>(
                    builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('total user : ${controller.userLength}'),
                            Text('total user : ${controller.totalAge}')
                          ],
                        )))
          ])),
    );
  }
}
