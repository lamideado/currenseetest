import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies", {"apiKey":"c6a6c630455c721a229d"},);

  Future<List<String>> getCurrencies() async {
    try {
      final response = await http.get(currencyURL);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.containsKey("results")) {
          final currencies = json["results"].keys.toList();
          print("List of Currencies:");
          for (final currency in currencies) {
            print(currencies);
          } return currencies;
        } else {
          throw const FormatException("Invalid API response format: missing 'results' key");
        }
      } else {
        throw http.ClientException(
            "API request failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      print(error); // Log the error for debugging
      rethrow; // Rethrow the original error for proper handling
    }
  }
  Future<double> getRate(String from, String to) async {
    final Uri rateUrl = Uri.https('free.currconv.com', '/api/v7/convert',{
      "apiKey":"c6a6c630455c721a229d",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response res = await http.get(rateUrl);
    if(res.statusCode == 200){
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    }else{
      throw Exception("Failed to connect to API");
    }
  }
}