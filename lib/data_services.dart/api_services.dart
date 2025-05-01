import 'dart:convert';
import 'dart:io' show Platform;
import 'package:amc_connect/models/login_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String Url = "https://amc.himalayawellness.in/newamctest/api/";
  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Authorization": "basic Q2hlbm5hUmVkZHk6SGltYWxheWE=" // Example header
    // Add more headers if needed
  };

  String checkPlatform() {
    String platformCheck = "";
    if (Platform.isAndroid) {
      platformCheck = "Android";
    } else if (Platform.isIOS) {
      platformCheck = "IOS";
    }
    return platformCheck;
  }

  Future<dynamic> post(endurl, data) async {
    final uri = Uri.parse(Url + endurl);
    print("URI $uri $data");
    try {
      final responce = await http.post(uri, body: jsonEncode(data), headers: _headers);
      print("ApiResponce${responce.statusCode}");
      if (responce.statusCode == 200) {
        print("log${jsonDecode(responce.body)}");
        return jsonDecode(responce.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
