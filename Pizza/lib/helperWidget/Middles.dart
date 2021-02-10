import 'package:Pizza/screen/DetailsScreen.dart';
import 'package:Pizza/services/ManageData.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MiddleHelpers extends ChangeNotifier {
  Widget textFav() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RichText(
            text: TextSpan(
                text: 'Favourite ',
                style: TextStyle(
                    shadows: [BoxShadow(color: Colors.black, blurRadius: 1)],
                    fontSize: 25,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w600),
                children: [
              TextSpan(
                  text: 'dishes',
                  style: TextStyle(
                      shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)],
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[900]))
            ])));
  }

  Widget dataFav(BuildContext context, String collection) {
    return Container(
        height: 300,
        child: FutureBuilder(
            future: Provider.of<ManageData>(context, listen: false)
                .fatchdata(collection),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Lottie.asset('animation/pizzaIcon.json')));
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      queryDocumentSnapshot:
                                          snapshot.data[index],
                                    ))),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                height: 300,
                                width: 230,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 3,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        SizedBox(
                                            height: 180,
                                            width: 220,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                    snapshot.data[index]
                                                        .data()['image'],
                                                    fit: BoxFit.cover))),
                                        Positioned(
                                            right: 10,
                                            child: IconButton(
                                                icon: Icon(EvaIcons.heart,
                                                    size: 30,
                                                    color: Colors.red),
                                                onPressed: () {}))
                                      ]),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                              snapshot.data[index]
                                                  .data()['name'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.grey[900]))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                              snapshot.data[index]
                                                  .data()['category'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.deepPurple))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.star_border,
                                                        color: Colors
                                                            .yellow.shade700),
                                                    Text(
                                                        snapshot.data[index]
                                                            .data()['ratings'],
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors
                                                                .green[700]))
                                                  ]),
                                              Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                        FontAwesomeIcons
                                                            .dollarSign,
                                                        size: 15,
                                                        color: Colors
                                                            .red.shade700),
                                                    Text(
                                                        snapshot.data[index]
                                                            .data()['price']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors
                                                                .red[700]))
                                                  ])
                                            ],
                                          ))
                                    ]))));
                  });
            }));
  }

  Widget textBusiness() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RichText(
            text: TextSpan(
                text: 'Business ',
                style: TextStyle(
                    shadows: [BoxShadow(color: Colors.black, blurRadius: 1)],
                    fontSize: 25,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w600),
                children: [
              TextSpan(
                  text: 'lunch',
                  style: TextStyle(
                      shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)],
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[900]))
            ])));
  }

  Widget dataBusiness(BuildContext context, String collection) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: Provider.of<ManageData>(
          context,
          listen: false,
        ).fatchdata(collection),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Lottie.asset('animation/pizzaIcon.json')));
          } else {
            return ListView.builder(
                itemCount: snapShot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      // height: 250,
                      width: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 3,
                                blurRadius: 5)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(snapShot.data[index].data()['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[900]))),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                              snapShot.data[index]
                                                  .data()['category'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.deepPurple))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                              '\$ ${snapShot.data[index].data()['notPrice']}'
                                                  .toString(),
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.red))),
                                      Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          children: [
                                            Icon(FontAwesomeIcons.dollarSign,
                                                size: 15,
                                                color: Colors.green.shade700),
                                            Text(
                                                snapShot.data[index]
                                                    .data()['price']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.green[700]))
                                          ])
                                    ]),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: SizedBox(
                                      height: 180,
                                      width: 220,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              snapShot.data[index]
                                                  .data()['image'],
                                              fit: BoxFit.cover))),
                                ),
                              ]),
                        ],
                      ));
                });
          }
        },
      ),
    );
  }
}
