import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selectable_data_list/menu_controller.dart';
import 'package:selectable_data_list/users.dart';

import 'HomePage.dart';

void main() => runApp(MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuController())
      ],
      child: HomePage(),
    )));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final columns = ['User Name', 'Age'];
  List<User> users;
  List<User> selectedUsers = [];

  // bool isSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.users = List.of(allUsers);
    // this.selectedUsers = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Selectable List')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: DataTable(
                columns: getColumns(columns),
                rows: getRows(users),
              ),
            )));
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<User> usersz) => usersz.map((User user) {
        final cells = [user.userName, user.age];

        return DataRow(
            selected: selectedUsers.contains(users),
            onSelectChanged: (isSelected) => setState(() {
                  final isAdding = isSelected != null && isSelected;

                  // isAdding
                  // ?    selectedUsers.addAll(users)
                  // : selectedUsers.remove(users);
                }),
            cells: rowCells(cells));
      }).toList();

  List<DataCell> rowCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('${data}'))).toList();
}
