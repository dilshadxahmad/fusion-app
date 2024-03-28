import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get(String url) async {
    dynamic decodedResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      decodedResponse = _returnResponse(response);
    } on Exception {
      throw 'Error Occurred';
    }
    return decodedResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic decodedResponse = jsonDecode(response.body);
        return decodedResponse;

      case 400:
        throw 'Bad request';

      case 404:
        throw 'Data Not Found';

      case 500:
        throw 'Internal Server Error';

      default:
        throw 'Unknown Error';
    }
  }
}
