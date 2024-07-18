import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpServices {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<String> postReq({required String title, required String content}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title, 'body': content}),
    );

    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Map<String, dynamic>> putReq({required int id, required String title, required String content}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title, 'body': content}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }
}
