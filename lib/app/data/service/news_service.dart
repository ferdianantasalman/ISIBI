import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiUrl;

  NewsService(this.apiUrl);

  getNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
