import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_database/models/transaction.dart';
import 'package:hive_database/services/crud_services.dart';
import 'package:hive_database/transaction_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  /// must needed
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  /// this line will be added after use flutter packages pub run build_runner build command in terminal
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [];
  double amount;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    ///
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {

    return TransactionPage();
  }}