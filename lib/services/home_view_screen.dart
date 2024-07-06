import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:melisa_store/model/login_model.dart';
import 'package:melisa_store/model/products_model.dart';

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
