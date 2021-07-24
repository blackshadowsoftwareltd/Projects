import 'package:flutter/cupertino.dart';
 
import 'package:user_ip/ip_api.dart';

class Services extends ChangeNotifier {
  String ip;
  Future<void> getIp() async {
    ip = IPApi.getIp().toString();
    print(ip);
    notifyListeners();
  }
}
