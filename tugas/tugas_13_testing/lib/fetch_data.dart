import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts({http.Client? client}) async {
  client ??= http.Client();
  final response = await client.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<dynamic>> fetchJewelery({http.Client? client}) async {
  client ??= http.Client();
  final response = await client.get(Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load jewelery');
  }
}
