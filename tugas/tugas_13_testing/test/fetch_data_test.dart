import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';


import 'package:tugas_13_testing/fetch_data.dart';

void main() {
  group('fetchProducts', () {
    test('returns a list of products if the http call completes successfully',
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          '[{"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men\'s clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}}]',
          200,
        );
      });

      final products = await fetchProducts(client: mockClient);
      expect(products, isA<List<dynamic>>());
      expect(products.length, 1);
      expect(products[0]['id'], 1);
    });

    test('throws an exception if the http call completes with an error', () {
      final mockClient = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      expect(fetchProducts(client: mockClient), throwsException);
    });
  });

  group('fetchJewelery', () {
    test('returns a list of jewelery if the http call completes successfully',
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          '[{"id":5,"title":"John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet","price":695,"description":"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.","category":"jewelery","image":"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg","rating":{"rate":4.6,"count":400}}]',
          200,
        );
      });

      final jewelery = await fetchJewelery(client: mockClient);
      expect(jewelery, isA<List<dynamic>>());
      expect(jewelery.length, 1);
      expect(jewelery[0]['id'], 5);
    });

    test('throws an exception if the http call completes with an error', () {
      final mockClient = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      expect(fetchJewelery(client: mockClient), throwsException);
    });
  });
}
