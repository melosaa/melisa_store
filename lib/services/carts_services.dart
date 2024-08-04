import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:melisa_store/model/add_to_cart_response_model.dart';
import 'package:melisa_store/model/login_model.dart';
import 'package:melisa_store/model/products_model.dart';
import 'package:melisa_store/model/user_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartsService {
  Future<List<CartModel>> fetchCarts() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = await prefs.getString("userId");
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/carts/user/$userId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => CartModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<AddToCartResponseModel> addToCart(int productId) async {

    print("productId: $productId");
    final body = json.encode({

      "userId": 3,
      "date": "2020-01-01T00:00:02.000Z",
      "products": [
        {"productId": productId, "quantity": 1}
      ],
      "__v": 0
    });

    final response = await http
        .post(Uri.parse('https://fakestoreapi.com/carts'), body: body);

    if (response.statusCode == 200) {
      return AddToCartResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product to cart');
    }
  }
}
