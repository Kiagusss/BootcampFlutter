
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_10_public_api/model/news_model.dart';


class NewsRepository {
  final String apiKey = '56ed049ef5bc46528dc791377a58a0f4';

  Future<NewsResponse> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
