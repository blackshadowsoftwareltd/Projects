import 'package:country_details_word_wide/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/country_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProviders>(context, listen: false);
    final serviceProvider =
        Provider.of<ServiceProviders>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text('Country details World Wide')),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                color: Colors.green.shade50,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: DropdownButton<CountryDetailsModel>(
                    iconEnabledColor: Colors.teal.shade700,
                    iconDisabledColor: Colors.grey.shade400,
                    iconSize: 25,
                    underline: Container(),
                    hint: Text(provider.countryName != null
                        ? serviceProvider.countryName!
                        : 'Select Country'),
                    onChanged: (CountryDetailsModel? value) {
                      provider.setCountryName(value!.countryName!);
                      provider.setSatateData(value);
                    },
                    items: provider.countries
                        .map((CountryDetailsModel e) => DropdownMenuItem(
                            value: e, child: Text(e.countryName!)))
                        .toList())),

            /// State selector
            Container(
                color: Colors.green.shade50,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: DropdownButton<StateModel>(
                  iconEnabledColor: Colors.teal.shade700,
                  iconDisabledColor: Colors.grey.shade400,
                  underline: Container(),
                  iconSize: 25,
                  hint: Text(provider.stateName != null
                      ? serviceProvider.stateName!
                      : 'Select State'),
                  onChanged: (StateModel? value) =>
                      provider.setStateName(value!.stateName!),
                  items: serviceProvider.states
                      .map((StateModel e) =>
                          DropdownMenuItem(value: e, child: Text(e.stateName!)))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
