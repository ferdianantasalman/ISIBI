import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=de89bb11687b4c3b9ebeecdf17bf0056");
  var response = await http.get(url);

  List data = (json.decode(response.body) as Map<String, dynamic>)["articles"];

  print(data[4]);
}
