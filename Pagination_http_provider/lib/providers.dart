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

  ///
  void setTried() {
    _tried = true;
    notifyListeners();
  }

  ///

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
        _page++;
        if (data.length < 10) {
          _tried = false;
        } else {
          _tried = true;
        }
        notifyListeners();
        return true;
      });
    }
  }

  void afterLoad(int page) {
    if (tried == false && data.length < 10) {

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
        _page++;

        if (data.length < 10) {
          _tried = false;
        } else {
          _tried = true;
        }

        notifyListeners();
        return true;
      });
    }
  }

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
      _page++;
      notifyListeners();
      return true;
    });
  }
}
