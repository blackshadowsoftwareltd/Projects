import 'package:http/http.dart' as http;
import 'passanger_model.dart';

class PassangerApi {
  static Future<PassengerModel>? getPassanger(page) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.instantwebtools.net/v1/passenger?page=$page&size=2'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      print(body);

      return PassengerModel.fromRawJson(body);
    } else {
      print(response.reasonPhrase);
      return PassengerModel();
    }
  }
}
