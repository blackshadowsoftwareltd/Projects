import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finalAddress = 'Searching Address...';

class GenerateMaps extends ChangeNotifier {
  Positioned positioned;
  GoogleMapController mapController;
  String finalAddres = 'Searching Address';
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String countryName, mainAddress = 'Mock Address';

  String get getCountryName => countryName;

  String get getMainAddress => mainAddress;

  String get getFinalAddress => finalAddres;

  Positioned get getPosition => positioned;

  Future getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    String mainAddress = addresses.first.addressLine;
    print('main address >>>>$mainAddress');
    finalAddress = mainAddress;
    notifyListeners();
  }

  Widget fetchMaps() {
    return GoogleMap(
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        mapToolbarEnabled: true,
        onTap: (loc) async {
          final cords = geoCo.Coordinates(loc.latitude, loc.longitude);
          var addres =
              await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
          countryName = addres.first.countryName;
          mainAddress = addres.first.addressLine;
          notifyListeners();
          markers == null
              ? getMaeker(loc.latitude, loc.longitude)
              : markers.clear();


          print(countryName);
          print(mainAddress);
        },
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController googleMapController) {
          mapController = googleMapController;
          notifyListeners();
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(21.000, 45.000), zoom: 18.0));
  }

  getMaeker(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: getMainAddress, snippet: 'Country name'));
    markers[markerId] = marker;
  }
}
