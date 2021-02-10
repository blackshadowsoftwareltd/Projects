import 'package:Pizza/Provider/Authentication.dart';
import 'package:Pizza/services/ManageData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, cartData = 0;
  String size;
  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      largeTapped = false,
      selected = false;

  String get getSize => size;

  int get getCheeseValue => cheeseValue;

  int get getBeaconValue => beaconValue;

  int get getOnionValue => onionValue;

  int get getCartData => cartData;

  bool get getSelected => selected;

  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  addOnion() {
    onionValue++;
    notifyListeners();
  }

  minusBeacon() {
    if (beaconValue > 0) {
      beaconValue--;
    }
    notifyListeners();
  }

  minusCheese() {
    if (cheeseValue > 0) {
      cheeseValue--;
    }
    notifyListeners();
  }

  minusOnion() {
    if (onionValue > 0) {
      onionValue--;
    }
    notifyListeners();
  }

  selectSmallSize() {
    smallTapped = true;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize() {
    mediumTapped = true;
    size = 'M';
    notifyListeners();
  }

  selectLargeSize() {
    largeTapped = true;
    size = 'L';
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    beaconValue = 0;
    onionValue = 0;
    smallTapped = false;
    mediumTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                height: 70,
                alignment: Alignment.center,
                color: Colors.deepPurpleAccent,
                child: Text('Selected Size',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)));
          });
    }
  }
}
