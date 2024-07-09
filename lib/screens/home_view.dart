import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/blocs/home/bloc/home_bloc.dart';
import 'package:melisa_store/model/products_model.dart';
import 'package:melisa_store/services/home_view_screen.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final Future<List<Product>> futureProduct = fetchProducts();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(243, 243, 243, 243),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(202, 190, 190, 0.051),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                            ),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildIconContainer(
                          icon: Icons.drag_indicator,
                          color: Colors.black,
                          borderColor: const Color.fromARGB(255, 212, 211, 211),
                        ),
                        const SizedBox(width: 10),
                        _buildIconContainer(
                          icon: Icons.shopping_cart,
                          color: Colors.blue,
                          borderColor: const Color.fromARGB(255, 212, 211, 211),
                        ),
                        const SizedBox(width: 10),
                        _buildIconContainer(
                          icon: CupertinoIcons.eyeglasses,
                          color: Colors.blue,
                          borderColor: const Color.fromARGB(255, 212, 211, 211),
                        ),
                        const SizedBox(width: 10),
                        _buildIconContainer(
                          icon: Icons.shopping_bag,
                          color: Colors.brown,
                          borderColor: const Color.fromARGB(255, 212, 211, 211),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 130,
                      width: 280,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(210, 118, 118, 119)),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 30,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                // margin: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          210, 118, 118, 119)),
                                  color:
                                      const Color.fromARGB(255, 212, 212, 211),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: const Icon(Icons.percent),
                              ),
                            ),
                            const Positioned(
                              top: 30,
                              left: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "50% OFF",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "on all women's shoes",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 35,
                              right: 25,
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Expanded(
                      child: FutureBuilder<List<Product>>(
                        future: futureProduct,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No products found'));
                          } else {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 2.0,
                                crossAxisCount: 2,
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Product product = snapshot.data![index];
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(30.0),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        232, 232, 232, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            product.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // Text(product.title,
                                      //     style: TextStyle(
                                      //         fontSize: 8,
                                      //         fontWeight: FontWeight.bold)),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      // Text(
                                      //   product.price.toStringAsFixed(2),
                                      //   style: TextStyle(fontSize: 8),
                                      // ),
                                      // TODO : üRÜN İSİMLERİ EKLENECEK
                                    ],
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
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 35, 39, 44),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
              backgroundColor: Color.fromARGB(255, 35, 39, 44),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.yellow,
              ),
              backgroundColor: Color.fromARGB(255, 35, 39, 44),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.yellow,
              ),
              backgroundColor: Color.fromARGB(255, 35, 39, 44),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.yellow,
              ),
              backgroundColor: Color.fromARGB(255, 35, 39, 44),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer({
    required IconData icon,
    required Color color,
    required Color borderColor,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon, color: color),
    );
  }
}
