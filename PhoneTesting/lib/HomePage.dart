import 'package:PhoneTesting/widgets/brandCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference brandsListRef =
      FirebaseFirestore.instance.collection('Brands');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Brands'),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: brandsListRef.get(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              Center(child: Text(snapShot.error));
            }
            if (snapShot.connectionState == ConnectionState.done) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                padding: EdgeInsets.all(5),
                children: snapShot.data.docs.map((document) {
                  return BrandCard(
                    brandName: document.data()['name'],
                    brandId: document.data()['id'],
                    brandImage: document.data()['url'],
                  );
                }).toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
