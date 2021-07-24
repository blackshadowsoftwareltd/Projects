/// This api will return the user's current IP address.

import 'package:http/http.dart' as http;

class IPApi {
  static Future<String> getIp() async {
    String ip;
    var headers = {
      'Authorization':
          '563492ad6f91700001000001ba4a863a870a4a1abb8a5aa80634ebaf'
    };
    var request = http.Request('GET', Uri.parse('https://api.ipify.org/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ip = await response.stream.bytesToString();
      // print(ip);

      return ip.toString();
    } else {
      print(response.reasonPhrase);
    }
    return ip;
  }
}
