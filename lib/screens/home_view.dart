import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/blocs/home/bloc/home_bloc.dart';
import 'package:melisa_store/model/products_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeBloc()
        ..add(const FetchProductsEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(243, 243, 243, 243),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeProductsFail) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state is HomeProductsSucces) {
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
                        child: GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final Product product = state.products[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          product.price.toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('No products found'));
            }

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
