import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/adapters/todo_adapter.dart';
import 'package:todo/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(MaterialApp(home: HomeScreen()));
}
