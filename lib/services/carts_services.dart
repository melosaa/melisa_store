import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:melisa_store/model/login_model.dart';
import 'package:melisa_store/model/products_model.dart';
import 'package:melisa_store/model/user_cart.dart';

class CartsService {
  Future<List<CartModel>> fetchCarts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/carts'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => CartModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
