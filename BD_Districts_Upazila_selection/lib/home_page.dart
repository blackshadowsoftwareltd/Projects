import 'package:bd_district_upazila/model/model.dart';
import 'package:bd_district_upazila/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProviders>(context, listen: false);
    final serviceProvider =
        Provider.of<ServiceProviders>(context, listen: true);
    return Scaffold(
        appBar: AppBar(title: Text('BD District & Upazila')),
        body: Container(
            width: double.infinity,
            child: Column(children: [
              /// district name selector
              Container(
                  color: Colors.green.shade50,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: DropdownButton<BdCountryDetails>(
                      iconEnabledColor: Colors.teal.shade700,
                      iconDisabledColor: Colors.grey.shade400,
                      iconSize: 25,
                      underline: Container(),
                      hint: Text(provider.districtName != null
                          ? serviceProvider.districtName!
                          : 'Select District'),
                      onChanged: (BdCountryDetails? value) {
                        provider.setDistrictName(
                            value!.districtName!); // set district name
                        provider.setUpazilaData(value); // set upazila list
                      },
                      items: provider.districts
                          .map((BdCountryDetails e) => DropdownMenuItem(
                              value: e, child: Text(e.districtName!)))
                          .toList())),

              /// upazila name seletor
              Container(
                  color: Colors.green.shade50,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: DropdownButton<Upazila>(
                      iconEnabledColor: Colors.teal.shade700,
                      iconDisabledColor: Colors.grey.shade400,
                      underline: Container(),
                      iconSize: 25,
                      hint: Text(provider.upazilaName != null
                          ? serviceProvider.upazilaName!
                          : 'Select Thana/Upzilla'),
                      onChanged: (Upazila? value) =>
                          provider.setUpazilaName(value!.upazilaName!),
                      items: serviceProvider.upazilas
                          .map((Upazila e) => DropdownMenuItem<Upazila>(
                                value: e,
                                child: Text(e.upazilaName!),
                              ))
                          .toList()))
            ])));
  }
}
