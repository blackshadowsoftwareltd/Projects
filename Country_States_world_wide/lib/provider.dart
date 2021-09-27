import 'package:flutter/cupertino.dart';

import 'model/country_model.dart';

class ServiceProviders extends ChangeNotifier {
  List<CountryDetailsModel> _countries = [];
  List<StateModel> _states = [];
  String? _countryName, _stateName;

  ///
  List<CountryDetailsModel> get countries => _countries;
  List<StateModel> get states => _states;
  String? get countryName => _countryName;
  String? get stateName => _stateName;

  ///

  void setCountryData() {
    getCountryDetails();
    countryDetails!.map((CountryDetailsModel e) => _countries.add(e)).toList();
    print(countries.length);
  }

  void setCountryName(String name) {
    _countryName = name;
    print(countryName);
    notifyListeners();
  }

  void setSatateData(data) {
    _stateName = null;
    _states.clear();
    data.states.map((StateModel e) => _states.add(e)).toList();
    print(states.length);
    notifyListeners();
  }

  void setStateName(String name) {
    _stateName = name;
    print(stateName);
    notifyListeners();
  }
}
