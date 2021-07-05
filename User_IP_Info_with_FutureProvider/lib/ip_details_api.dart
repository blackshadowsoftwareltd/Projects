import 'package:http/http.dart' as http;
import 'package:user_ip/ip_details_model.dart';

import 'ip_api.dart';

class IPDetailsApi {
  static Future<IpDetailsModel> getIpDetails() async {
    var headers = {
      'Authorization':
          '563492ad6f91700001000001ba4a863a870a4a1abb8a5aa80634ebaf'
    };

    var request = http.Request('GET', Uri.parse('https://ipapi.co/103.165.163.155/json/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonBody = await response.stream.bytesToString();
      print(jsonBody);
      return IpDetailsModel.fromRawJson(jsonBody);
    } else {
      print(response.reasonPhrase);
    }
  }
}
