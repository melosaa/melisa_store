class LoginResponse {
  final String token;
  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"],
    );
  }
}

class LoginApi {
  late String username;
  late String password;

  LoginApi({required this.username, required this.password});

  factory LoginApi.fromJson(Map<String, dynamic> json) {
    return LoginApi(username: json["username"], password: json["password"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
