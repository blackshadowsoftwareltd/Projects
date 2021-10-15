import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/add_todo.dart';
import 'adapters/todo_adapter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hive Todo')),
        body: ValueListenableBuilder(
            valueListenable: Hive.box<Todo>('todos').listenable(),
            builder: (context, Box<Todo> box, _) {
              if (box.values.isEmpty) {
                return const Center(child: Text('Empty'));
              }
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    Todo todo = box.getAt(index)!;
                    return zTile(context, todo, index); // return ListTile(
                    //   title: Text(todo.title.toString()),
                    //   subtitle: Text(todo.description.toString()),
                    //   onLongPress: () async => box.deleteAt(index),
                    // );
                  });
            }),

        /// navigate to add data screen
        floatingActionButton: FloatingActionButton.small(
            child: const Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => AddToDoScreen(
                            onPressed: (String title, String description) {
                          Box<Todo> todoBox = Hive.box<Todo>('todos');
                          final data =
                              Todo(title: title, description: description);
                          todoBox.add(data);
                          // todoBox.add(
                          //     Todo(title: title.toString(), description: description.toString()));
                        })))));
  }

  ///
  Widget zTile(context, Todo data, index) {
    Box<Todo> todoBox = Hive.box<Todo>('todos');
    return Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
              child: Column(children: [
            Text(data.title.toString()),
            Text(data.description.toString())
          ])),
          Row(children: [
            IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AddToDoScreen(
                              todo: data,
                              onPressed: (String title, String description) {
                                Box<Todo> todoBox = Hive.box<Todo>('todos');

                                /// without index (data update)
                                data.title = title;
                                data.description = description;
                                data.save();

                                /// with index (data update)
                                // todoBox.putAt(index,
                                //     Todo(title: 'ff', description: 'xyz'));
                              })));
                }),

            ///
            IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  /// with out index (delete)
                  data.delete();

                  /// with index (delete)
                  // todoBox.deleteAt(index);
                })
          ])
        ]));
  }
}
