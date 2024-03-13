import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:currenseetest/widgets/searchbox.dart';
import 'package:currenseetest/themes/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${Key.key}&q=${SearchBarr.searchcontroller.text}'),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}