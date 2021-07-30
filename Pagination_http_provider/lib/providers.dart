import 'package:flutter/cupertino.dart';
import 'package:pagination/passanger_api.dart';
import 'package:pagination/passanger_model.dart';

class PassengerProvider extends ChangeNotifier {
  Future<bool>? _isLoad = null;
  bool _tried = false;
  int _page = 1;
  int? _totalPage;
  List<Passenger> _data = [];

  ///
  Future<bool>? get isLoad => _isLoad;
  bool get tried => _tried;
  int get page => _page;
  int? get totalPage => _totalPage;
  List<Passenger> get data => _data;

  /// Initial load
  void load() {
    if (isLoad == null) {
      _isLoad = PassangerApi.getPassanger(page)!.then((value) {
        _totalPage = value.totalPages!;
        value.data!
            .map((Passenger e) => _data.add(Passenger(
                id: e.id,
                name: e.name,
                airline: e.airline,
                trips: e.trips,
                v: e.v)))
            .toList();

        /// After calling this method automatic page number will be increased.
        _page++;

        /// condition for the _tried variable
        if (data.length < 6) {
          _tried = false;
        } else {
          _tried = true;
        }
        notifyListeners();
        return true;
      });
    }
  }

  /// if the condition is true>> data.length < 6
  void afterLoad(int page) {
    if (tried == false && data.length < 6) {
      _isLoad = PassangerApi.getPassanger(page)!.then((value) {
        _totalPage = value.totalPages!;
        value.data!
            .map((Passenger e) => _data.add(Passenger(
                id: e.id,
                name: e.name,
                airline: e.airline,
                trips: e.trips,
                v: e.v)))
            .toList();

        /// After calling this method automatic page number will be increased.
        _page++;

        /// condition for the _tried variable
        if (data.length < 6) {
          _tried = false;
        } else {
          _tried = true;
        }

        notifyListeners();
        return true;
      });
    }
  }

  /// Pagination load.
  Future<void> reload(int page) async {
    await PassangerApi.getPassanger(page)!.then((value) {
      _totalPage = value.totalPages!;
      value.data!
          .map((Passenger e) => _data.add(Passenger(
              id: e.id,
              name: e.name,
              airline: e.airline,
              trips: e.trips,
              v: e.v)))
          .toList();

      /// After calling this method automatic page number will be increased.
      _page++;
      notifyListeners();
      return true;
    });
  }
}
