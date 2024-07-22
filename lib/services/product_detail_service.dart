import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:melisa_store/model/products_model.dart';

Future<Product> fetchProductDetail(int id) async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

  if (response.statusCode == 200) {
    final pruductJson = json.decode(response.body);
    return Product.fromJson(pruductJson);
  } else {
    throw Exception('Failed to load product');
  }
}
