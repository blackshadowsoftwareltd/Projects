import 'package:Pizza/MiniViews/Maps.dart';
import 'package:Pizza/Provider/Authentication.dart';
import 'package:Pizza/Provider/Calculations.dart';
import 'package:Pizza/Provider/PaymentProvid.dart';
import 'package:Pizza/screen/SplashScreen.dart';
import 'package:Pizza/services/ManageData.dart';
import 'package:Pizza/services/Maps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Razorpay razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = Razorpay();
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        Provider.of<PaymentHelper>(context, listen: false)
            .handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        Provider.of<PaymentHelper>(context, listen: false).handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET,
        Provider.of<PaymentHelper>(context, listen: false)
            .handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  int price = 10, total = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        ListView(padding: EdgeInsets.all(10), children: [
          SizedBox(height: 60),
          headerText(context),
          cartsData(context),
          shippingDetails(context),
          billingData(context),
        ]),
        appBar(context),
      ]),
      floatingActionButton: Provider.of<PaymentHelper>(context, listen: false)
              .getShowCheckOutButton
          ? floatingActionButton(context)
          : null,
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
            onPressed: () {
              Provider.of<ManageData>(context, listen: false)
                  .deleteData(context);
              Provider.of<Calculations>(context, listen: false).cartData = 0;
            },
          )
        ]));
  }

  Widget headerText(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Text('Cart',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 38,
                      fontWeight: FontWeight.w900))
            ]));
  }

  Widget cartsData(BuildContext context) {
    return SizedBox(
        height: 300,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Lottie.asset('animation/pizzaIcon.json')),
                );
              } else {
                return ListView(
                    children: snapShot.data.docs
                        .map((DocumentSnapshot documentSnapshot) {
                  return Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5,
                                spreadRadius: 2)
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      documentSnapshot.data()['images'],
                                      fit: BoxFit.cover,
                                    )),
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(documentSnapshot.data()['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.deepPurpleAccent,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                      'Price : \$${documentSnapshot.data()['price']}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      'Size : ${documentSnapshot.data()['size']}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      'Cheese : ${documentSnapshot.data()['cheese'].toString()}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      'Beacon : ${documentSnapshot.data()['beacon'].toString()}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      'Onion : ${documentSnapshot.data()['onion'].toString()}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400))
                                ])
                          ]));
                }).toList());
              }
              return null;
            }));
  }

  Widget shippingDetails(BuildContext context) {
    return Container(
        // height: 120,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 3, spreadRadius: 4)
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: FloatingActionButton(
                                heroTag: 'time',
                                child: Icon(Icons.more_time,
                                    color: Colors.white, size: 25),
                                backgroundColor: Colors.deepPurpleAccent,
                                onPressed: () => Provider.of<PaymentHelper>(
                                        context,
                                        listen: false)
                                    .selectTime(context))),
                        Text(
                            'Delivery Time ${Provider.of<PaymentHelper>(context, listen: true).deliveryTime.format(context)}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ))
                      ])),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: FloatingActionButton(
                                heroTag: 'location',
                                child: Icon(Icons.edit_location_rounded,
                                    color: Colors.white, size: 25),
                                backgroundColor: Colors.deepPurpleAccent,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Maps())))),
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                              Provider.of<GenerateMaps>(context, listen: true)
                                  .getMainAddress,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700])),
                        )
                      ])),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: FloatingActionButton(
                              heroTag: 'payment',
                              child: Icon(Icons.payment,
                                  color: Colors.white, size: 25),
                              backgroundColor: Colors.deepPurpleAccent,
                              onPressed: () async => checkMeOut().whenComplete(
                                  () => Provider.of<PaymentHelper>(context,
                                          listen: false)
                                      .showCheckButtonMethod()),
                            )),
                        Text('Add Payment options',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]))
                      ]))
            ]));
  }

  Widget billingData(BuildContext context) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 70),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 3, spreadRadius: 4)
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500)),
                      Row(children: [
                        Icon(FontAwesomeIcons.dollarSign,
                            size: 20, color: Colors.red),
                        Text('50',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w400))
                      ])
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Charges',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500)),
                      Row(children: [
                        Icon(FontAwesomeIcons.dollarSign,
                            size: 20, color: Colors.red),
                        Text('5',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w400))
                      ])
                    ]),
              ),
              Divider(
                height: .1,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Charges',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900)),
                        Row(children: [
                          Icon(FontAwesomeIcons.dollarSign,
                              size: 20, color: Colors.red),
                          Text('55',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900))
                        ])
                      ]))
            ]));
  }

  Widget floatingActionButton(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await FirebaseFirestore.instance.collection('AdminCollection').add({
            'time': Provider.of<PaymentHelper>(context, listen: false)
                .deliveryTime
                .format(context),
            'location': Provider.of<GenerateMaps>(context, listen: false)
                .getMainAddress,
            'userName': Provider.of<Authentication>(context, listen: false)
                        .getEmail ==
                    null
                ? userMail
                : Provider.of<Authentication>(context, listen: false).getEmail,
          });
        },
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              'Place an Order',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )));
  }

  Future checkMeOut() async {
    var options = {
      'key': 'rzp_test_FWej4yiXx5dkCM',
      'amount': total,
      'name': Provider.of<Authentication>(context, listen: false).getEmail,
      'description': 'Payment',
      'profile': {
        'contact': '000000',
        'email': Provider.of<Authentication>(context, listen: false).getEmail,
      },
      'external': {
        'wallet': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
