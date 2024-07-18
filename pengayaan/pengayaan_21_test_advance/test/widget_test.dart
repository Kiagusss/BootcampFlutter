import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:pengayaan_21_test_advance/services/http_services.dart';


void main() {
  /// Http Services
  final HttpServices services = HttpServices();

  /// Group untuk testing API Service
  group('API Service Test', () {
    /// Test case untuk POST Request
    test('Post Request Test', () async {
      /// Post Req
      final res = await services.postReq(
        title: "Post Test",
        content: "Content Test",
      );

      /// Parse the JSON
      final json = jsonDecode(res);

      /// Expect data title sesuai dengan yang kita input
      expect(json['title'], 'Post Test');

      /// Expect data body sesuai dengan yang kita input
      expect(json['body'], 'Content Test');
    });

    /// Test case untuk PUT Request
    test('Put Request Test', () async {
      /// Put Req
      final res = await services.putReq(
        id: 1,
        title: "Put Test",
        content: "Content Test",
      );

      /// Expect data id sesuai dengan yang kita input
      expect(res['id'], 1);

      /// Expect data title sesuai dengan yang kita input
      expect(res['title'], 'Put Test');

      /// Expect data body sesuai dengan yang kita input
      expect(res['body'], 'Content Test');
    });
  });
}
