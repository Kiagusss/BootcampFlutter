import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pengayaan_7_rest/model/comment_model.dart';


class CommentServices {
  static Future<Comment> fetchComment(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'));

    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load Comment');
    }
  }

  static Future<List<Comment>> getComments() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
