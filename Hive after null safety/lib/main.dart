import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivez/model/model.dart';
import 'package:hivez/model/product.dart';

import 'product_screen.dart';

void main() async {
  await Hive.initFlutter();

  ///
  Hive.registerAdapter(
      ProductModelAdapter()); // adapter come from product.g.dart
  await Hive.openBox<ProductModel>('product');

  ///
  Hive.registerAdapter(UserAdapter()); // adapter come from model.g.dart

  await Hive.openBox<User>('user'); // box type User (not UserAdapter)
  /// set default data. when box is empty. must need
  if (Hive.box<User>('user').isEmpty) {
    List<User> list = [];
    Hive.box<User>('user') // must need box type <User>. every time
        .put(0, User(userId: 0, userName: 'MR.X', usersList: list));
  }

  // runApp(MaterialApp(home: ProductScreen()));
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, savedName;
  int? id, savedId;

  @override
  Widget build(BuildContext context) {
    /// getting initial data from the box
    final data =
        Hive.box<User>('user').values.first; // .first means>> 0 index position

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(title: Text('Hive')),
        body: Container(
            width: double.infinity,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      placeholder: 'Name',
                      onChanged: (text) => setState(() => name = text))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      placeholder: 'User ID',
                      keyboardType: TextInputType.number,
                      onChanged: (text) =>
                          setState(() => id = int.parse(text)))),
              Container(
                  child: CupertinoButton(
                      child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text('Add')),
                      onPressed: () async {
                        ///
                        final box = Hive.box<User>('user');

                        if (name != null && id != null) {
                          /// getting saved data from the box
                          final data = Hive.box<User>('user')
                              .values
                              .first; // .first means>> 0 index position
                          List<User> previourList = List.of(
                              data.usersList); // copy list from hive database
                          previourList.add(User(
                              userName: name!,
                              userId: id!,
                              usersList: data.usersList));

                          /// put data
                          await box.put(
                              0,
                              User(
                                  userName: name!,
                                  userId: id!,
                                  usersList: previourList));
                          setState(() {}); // setState to change current state
                        }
                      })),

              /// data preview
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('......... last insert........'),
              ),
              Text('ID: ${data.userId} \nName: ${data.userName}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('......... list........'),
              ),
              ...data.usersList
                  .map(
                      (User e) => Text('Id: ${e.userId}.  Name: ${e.userName}'))
                  .toList()
            ])),
        floatingActionButton: Container(
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                      onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProductScreen())),
                      label: Text('Product screen')),

                  ///
                  FloatingActionButton(
                      heroTag: 'b',
                      child: Icon(Icons.clear_all),
                      onPressed: () async {
                        final box = Hive.box<User>('user');
                        await box.clear();

                        /// reinitializ. because box cannot be null. then setState
                        if (Hive.box<User>('user').isEmpty) {
                          List<User> list = [];
                          Hive.box<User>(
                                  'user') // must need box type <User>. every time
                              .put(
                                  0,
                                  User(
                                      userId: 0,
                                      userName: 'MR.X',
                                      usersList: list));
                        }
                        setState(() {});
                      })
                ])));
  }
}
