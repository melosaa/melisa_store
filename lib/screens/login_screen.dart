import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:melisa_store/model/login_model.dart';
import 'package:melisa_store/screens/home_view.dart';
import 'package:melisa_store/screens/login_screen.dart';
import 'package:melisa_store/services/loginservice_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController usernameController =
      TextEditingController(text: "johnd");
  final TextEditingController passwordController =
      TextEditingController(text: "m38rmF\$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: const Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.grey[100],
                            ),
                            child: TextField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                hintText: "e-mail or phone number",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: const Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.grey[100],
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                hintText: "password",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Center(
                            child: Text("Forgot Password?"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final username = usernameController.text;
                              final password = passwordController.text;
                              final response =
                                  await loginApi(username, password);

                              print("login succesful : ${response.token}");
                              Navigator.of(context).pushNamed("/home");
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Center(
                              child: const Text("Continue with social media")),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                  height: 50,
                                  child: const Center(child: Text("Facebook")),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black,
                                  ),
                                  height: 50,
                                  child: const Center(
                                    child: Text(
                                      "github",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
