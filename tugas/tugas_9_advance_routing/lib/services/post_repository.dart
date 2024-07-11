import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/post_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class PostRepository {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
  

  Future<Post> getPostDetail(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post detail');
    }
  }
}


