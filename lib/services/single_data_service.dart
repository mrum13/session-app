import 'dart:convert';
import 'package:http/http.dart' as http;

class SingleDataService {
  Future<String> getSingleData() async {
    try {
      var url = 'https://reqres.in/api/users/2';
      var header = {
        'Accept': 'application/json',
      };

      var response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      var data = jsonDecode(response.body);

      try {
        return data['data']['email'];
      } catch (e) {
        throw 'error get data';
      }
    } catch (e) {
      rethrow;
    }
  }
}
