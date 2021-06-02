import 'package:flutter/material.dart';
import 'package:pex/Screens/SearchPage.dart';

class SearchPanel extends StatelessWidget {
  TextEditingController controller;
  String data = 'bangladesh';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue,
      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            onChanged: (value) => data = value.toLowerCase(),
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Search Wallpaper'),
          )),
          IconButton(
              icon: Icon(Icons.search, color: Colors.grey[700]),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            queryText: data != '' ? data : 'bangladesh',
                          ))))
        ],
      ),
    );
  }
}
