import 'package:Pizza/helperWidget/Footer.dart';
import 'package:Pizza/helperWidget/Headers.dart';
import 'package:Pizza/helperWidget/Middles.dart';
import 'package:Pizza/services/Maps.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();

    getCurrentLocation();
  }

  String address = 'Searching Address...';

  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Headers().appBar(context),
                        SizedBox(height: 80),
                        Headers().headerText(widths),
                        Headers().headerMenu(context),
                        Divider(
                          color: Colors.deepPurpleAccent,
                          thickness: .5,
                        ),
                        MiddleHelpers().textFav(),
                        MiddleHelpers().dataFav(context, 'favourite'),
                        MiddleHelpers().textBusiness(),
                        MiddleHelpers().dataBusiness(context, 'business')
                      ]))),
          Headers().appBar(context,address),
        ],
      ),
      floatingActionButton: Footers().floatinActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    String mainAddress = addresses.first.addressLine;
    print('main address >>>>$mainAddress');
    setState(() {
      address = mainAddress;
    });
  }
}
