import 'package:flutter/material.dart';
import 'package:pex/Components/Categories.dart';
import 'package:pex/Components/Components.dart';
import 'package:pex/Components/Search.dart';
import 'package:pex/Components/Trending.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Pexels', style: TextStyle(color: Colors.black))),
        body: Column(children: [SearchPanel(), CategoriesPanle(), Trending()]));
  }
}
