import 'package:flutter/material.dart';

import 'Preview.dart';

class DemoView extends StatelessWidget {
  final String url;
  final String author;
  final String originalImage;

  const DemoView({Key key, this.url, this.author, this.originalImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Preview(
                        url: originalImage,
                      ))),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(url, fit: BoxFit.cover))),
        ),
        Positioned(
            left: 20,
            bottom: 20,
            child: Text(author,
                style: TextStyle(
                  color: Colors.white,
                )))
      ],
    );
  }
}
