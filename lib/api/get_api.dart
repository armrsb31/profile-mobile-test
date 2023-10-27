import 'dart:convert';

import 'package:http/http.dart' as http;

class GetAPI {
  getUser({int? countUser}) async {
    try {
      var response = await http.get(Uri.parse('https://randomuser.me/api?results=$countUser'));
      print(response.body);
      var body = jsonDecode(response.body);
      if (body['results'] != null) {
        return body;
      }
    } catch (error) {
      print('error');
      print(error);
    }
  }
}
