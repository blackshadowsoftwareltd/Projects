import 'package:flutter/cupertino.dart';

import 'model/model.dart';

class ServiceProviders extends ChangeNotifier {
  List<BdCountryDetails> _districts = [];
  List<Upazila> _upazilas = [];
  String? _districtName, _upazilaName;

  ///
  List<BdCountryDetails> get districts => _districts;
  List<Upazila> get upazilas => _upazilas;
  String? get districtName => _districtName;
  String? get upazilaName => _upazilaName;

  ///
  void setDistrictData() {
    getCountryDetailsbd();
    bdcountryDetails!.map((BdCountryDetails e) => _districts.add(e)).toList();
  }

  void setDistrictName(String name) {
    _districtName = name;
    print(districtName);
    notifyListeners();
  }

  void setUpazilaData(data) {
    _upazilaName = null;
    _upazilas.clear();
    data.upazila.map((Upazila e) => _upazilas.add(e)).toList();

    notifyListeners();
  }

  void setUpazilaName(String name) {
    _upazilaName = name;
    print(upazilaName);
    notifyListeners();
  }
}
