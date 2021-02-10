import 'package:PhoneTesting/widgets/modelCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PhoneModels extends StatefulWidget {
  final String brandName, brandId;

  PhoneModels({this.brandName, this.brandId});

  @override
  _PhoneModelsState createState() => _PhoneModelsState();
}

class _PhoneModelsState extends State<PhoneModels> {
  final CollectionReference brandsLitRef =
      FirebaseFirestore.instance.collection('Brands');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brandName),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future:
            brandsLitRef.doc(widget.brandId).collection(widget.brandId).get(),
        builder: (context, snapShots) {
          if (snapShots.hasError) {
            return Center(child: Text(snapShots.error));
          }
          if (snapShots.connectionState == ConnectionState.done) {
            return ListView(
              padding: EdgeInsets.all(5),
              children: snapShots.data.docs.map((docs) {
                return ModelCard(
                  modelName: docs.data()['name'],
                );
              }).toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
