import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeViewApi {
  void getApi() async {
    final response = await http.get("https://fakestoreapi.com/products" as Uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print("istek Başarısız ${response.statusCode}");
    }
  }
}
