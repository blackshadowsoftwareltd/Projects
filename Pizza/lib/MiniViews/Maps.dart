import 'package:Pizza/services/Maps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Provider.of<GenerateMaps>(context, listen: false).fetchMaps(),
            Positioned(
                bottom: 10,
                left: 30,
                right: 60,
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 120,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                        Provider.of<GenerateMaps>(context, listen: true)
                            .getMainAddress,
                        style: TextStyle(fontSize: 15, color: Colors.white)))),
            Positioned(
                top: 5,
                left: 5,
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 22, color: Colors.white),
                    onPressed: () => Navigator.pop(context)))
          ],
        ),
      ),
    );
  }
}
