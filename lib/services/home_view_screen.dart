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

Future<LoginResponse> loginApi(String username, String password) async {
  LoginApi loginData = LoginApi(username: username, password: password);

  final response = await http.post(
    Uri.parse("https://fakestoreapi.com/auth/login"),
    body: jsonEncode(loginData.toJson()),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to login");
  }
}
