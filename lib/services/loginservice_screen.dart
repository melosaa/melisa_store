import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:melisa_store/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginResponse> loginApi(String username, String password) async {
  LoginApi loginData = LoginApi(username: username, password: password);
  final prefs = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse("https://fakestoreapi.com/auth/login"),
    body: jsonEncode(loginData.toJson()),
    headers: {'Content-Type': 'application/json'},
  );
  print(response);
  if (response.statusCode == 200) {
    final userJwtToken = LoginResponse.fromJson(jsonDecode(response.body));
    final jwt = JWT.decode(userJwtToken.token);
    await prefs.setString("userId", jwt.payload["sub"].toString());
    return userJwtToken;
  } else {
    throw Exception("Failed to login");
  }
}
