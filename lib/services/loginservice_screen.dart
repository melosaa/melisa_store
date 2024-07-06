import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:melisa_store/model/login_model.dart';

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
