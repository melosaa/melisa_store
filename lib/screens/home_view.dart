import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:melisa_store/model/products_model.dart';
import 'package:melisa_store/services/home_view_screen.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     AutoRoute(page: HomeView, initial: true),
//   ],
// )
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(243, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(202, 190, 190, 0.051),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconContainer(
                    icon: Icons.drag_indicator,
                    color: Colors.black,
                    borderColor: const Color.fromARGB(255, 212, 211, 211),
                  ),
                  const SizedBox(width: 20),
                  _buildIconContainer(
                    icon: Icons.shopping_cart,
                    color: Colors.blue,
                    borderColor: const Color.fromARGB(255, 212, 211, 211),
                  ),
                  const SizedBox(width: 20),
                  _buildIconContainer(
                    icon: CupertinoIcons.eyeglasses,
                    color: Colors.blue,
                    borderColor: const Color.fromARGB(255, 212, 211, 211),
                  ),
                  const SizedBox(width: 20),
                  _buildIconContainer(
                    icon: Icons.shopping_bag,
                    color: Colors.brown,
                    borderColor: const Color.fromARGB(255, 212, 211, 211),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: 480,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(210, 118, 118, 119)),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        left: 50,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(210, 118, 118, 119)),
                            color: const Color.fromARGB(255, 212, 212, 211),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(Icons.percent),
                        ),
                      ),
                      const Positioned(
                        top: 30,
                        left: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "50% OFF",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "on all women's shoes",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        right: 60,
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No products found'));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 30.0,
                          mainAxisSpacing: 30.0,
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Product product = snapshot.data![index];
                          return Container(
                            padding: EdgeInsets.all(6.0),
                            margin: EdgeInsets.all(2.0),
                            color: Colors.black,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(232, 232, 232, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // TODO : üRÜN İSİMLERİ EKLENECEK
                                  // const SizedBox(height: 10),
                                  // Text(
                                  //   product.title,
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  //   maxLines: 1,
                                  //   overflow: TextOverflow.ellipsis,
                                  // ),
                                  // const SizedBox(height: 5),
                                  // Text('\$${product.price.toStringAsFixed(2)}'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 35, 39, 44),
            icon: Icon(Icons.home, color: Colors.yellow),
            label: "home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 35, 39, 44),
            icon: Icon(Icons.favorite, color: Colors.yellow),
            label: "favorites",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 35, 39, 44),
            icon: Icon(Icons.shopping_cart, color: Colors.yellow),
            label: "shopping",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 35, 39, 44),
            icon: Icon(Icons.person, color: Colors.yellow),
            label: "account",
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer({
    required IconData icon,
    required Color color,
    required Color borderColor,
  }) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon, color: color),
    );
  }
}
