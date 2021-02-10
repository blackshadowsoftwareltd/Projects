import 'package:Pizza/Provider/Calculations.dart';
import 'package:Pizza/screen/CartPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  DetailsScreen({this.queryDocumentSnapshot});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, totalItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ListView(padding: EdgeInsets.all(10), children: [
          SizedBox(
            height: 80,
          ),
          pizzaImage(context),
          middleData(context),
          footerDetails(context)
        ]),
        appBar(context)
      ]),
      floatingActionButton: floatingAcitonButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              blurRadius: 2,
              spreadRadius: 1)
        ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.deepPurple,
              ),
              onPressed: () => Navigator.pop(context)),
          IconButton(
              icon: Icon(FontAwesomeIcons.trash, size: 25, color: Colors.red),
              onPressed: () => Provider.of<Calculations>(context, listen: false)
                  .removeAllData())
        ]));
  }

  Widget pizzaImage(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 220,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(widget.queryDocumentSnapshot['image']),
                ))));
  }

  Widget middleData(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 25),
                    Text(widget.queryDocumentSnapshot['ratings'],
                        style: TextStyle(fontSize: 18, color: Colors.green))
                  ])),
          Text(widget.queryDocumentSnapshot['name'],
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.w500)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FontAwesomeIcons.dollarSign,
                        size: 20, color: Colors.red),
                    Text(widget.queryDocumentSnapshot['price'].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w400))
                  ]))
        ]);
  }

  Widget footerDetails(BuildContext context) {
    return SizedBox(
        height: 370,
        child: Stack(children: [
          Container(
              height: 290,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 4)
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Divider(
                      color: Colors.purple[900],
                      height: .5,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('Add more stuff',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w400))),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cheese',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w400)),
                              Row(children: [
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.minus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .minusCheese()),
                                Text(
                                    Provider.of<Calculations>(context,
                                            listen: true)
                                        .getCheeseValue
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w500)),
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.plus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .addCheese())
                              ])
                            ])),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Beacon',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w400)),
                              Row(children: [
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.minus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .minusBeacon()),
                                Text(
                                    Provider.of<Calculations>(context,
                                            listen: true)
                                        .getBeaconValue
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w500)),
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.plus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .addBeacon())
                              ])
                            ])),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Onion',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w400)),
                              Row(children: [
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.minus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .minusOnion()),
                                Text(
                                    Provider.of<Calculations>(context,
                                            listen: true)
                                        .getOnionValue
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w500)),
                                IconButton(
                                    icon: Icon(
                                      EvaIcons.plus,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => Provider.of<Calculations>(
                                            context,
                                            listen: false)
                                        .addOnion())
                              ])
                            ]))
                  ])),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                onTap: () => Provider.of<Calculations>(context, listen: false)
                    .selectSmallSize(),
                child: Container(
                    height: 45,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Provider.of<Calculations>(context, listen: true)
                                .smallTapped
                            ? Colors.deepPurpleAccent
                            : Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('S',
                        style: TextStyle(
                            fontSize: 22,
                            color:
                                Provider.of<Calculations>(context, listen: true)
                                        .smallTapped
                                    ? Colors.white
                                    : Colors.deepPurple,
                            fontWeight: FontWeight.bold)))),
            GestureDetector(
                onTap: () => Provider.of<Calculations>(context, listen: false)
                    .selectMediumSize(),
                child: Container(
                    height: 45,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Provider.of<Calculations>(context, listen: true)
                                .mediumTapped
                            ? Colors.deepPurpleAccent
                            : Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('M',
                        style: TextStyle(
                            fontSize: 22,
                            color:
                                Provider.of<Calculations>(context, listen: true)
                                        .mediumTapped
                                    ? Colors.white
                                    : Colors.deepPurple,
                            fontWeight: FontWeight.bold)))),
            GestureDetector(
                onTap: () => Provider.of<Calculations>(context, listen: false)
                    .selectLargeSize(),
                child: Container(
                    height: 45,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Provider.of<Calculations>(context, listen: true)
                                .largeTapped
                            ? Colors.deepPurpleAccent
                            : Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('L',
                        style: TextStyle(
                            fontSize: 22,
                            color:
                                Provider.of<Calculations>(context, listen: true)
                                        .largeTapped
                                    ? Colors.white
                                    : Colors.deepPurple,
                            fontWeight: FontWeight.bold)))),
          ])
        ]));
  }

  Widget floatingAcitonButton(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Stack(children: [
        FloatingActionButton(
            heroTag: 'homeToDetails',
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(Icons.shopping_bag_outlined, size: 20),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()))),
        Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
                backgroundColor: Colors.purple[900],
                radius: 13,
                child: Text('$totalItems',
                    style: TextStyle(fontSize: 15, color: Colors.white))))
      ]),
      GestureDetector(
          onTap: () => Provider.of<Calculations>(context, listen: false)
                  .addToCart(context, {
                'images': widget.queryDocumentSnapshot['image'],
                'name': widget.queryDocumentSnapshot['name'],
                'price': widget.queryDocumentSnapshot['price'],
                'cheese': Provider.of<Calculations>(context, listen: false)
                    .getCheeseValue,
                'beacon': Provider.of<Calculations>(context, listen: false)
                    .getBeaconValue,
                'onion': Provider.of<Calculations>(context, listen: false)
                    .getOnionValue,
                'size': Provider.of<Calculations>(context, listen: false)
                    .getSize,
              }),
          child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )))
    ]);
  }
}
