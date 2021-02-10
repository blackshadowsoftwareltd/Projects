import 'package:PhoneTesting/phoneModes.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatefulWidget {
  final String brandName, brandImage, brandId;

  BrandCard({this.brandId, this.brandImage, this.brandName});

  @override
  _BrandCardState createState() => _BrandCardState();
}

class _BrandCardState extends State<BrandCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhoneModels(
                      brandName: widget.brandName,
                      brandId: widget.brandId,
                    )));
        print(widget.brandName);
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      widget.brandImage,
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(widget.brandName,
                      style: TextStyle(fontSize: 22, color: Colors.black45)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
