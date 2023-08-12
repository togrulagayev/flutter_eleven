import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_eleven/models/products_fakestore.dart';
import 'package:http/http.dart' as http;

Future<List<FakeStoreProducts>?> getFakeStoreProductsWithHttp() async {
  var uri = Uri.parse('https://fakestoreapi.com/products');
  var res = await http.get(uri);

  try {
    if (res.statusCode == 200) {
      var body = json.decode(res.body) as List;
      return body.map((e) => FakeStoreProducts.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<FakeStoreProducts>?> getFakeStoreProductsWithDio() async {
  var url = 'https://fakestoreapi.com/products';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var body = res.data as List;
      return body.map((e) => FakeStoreProducts.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
