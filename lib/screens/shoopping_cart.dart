import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/model/products_model.dart';

import 'package:melisa_store/services/carts_services.dart';

import '../blocs/bloc/cart_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      backgroundColor: Color.fromARGB(255, 244, 242, 242),
      body: BlocProvider<CartBloc>(
        create: (context) {
          final cartBloc = CartBloc(cartsService: CartsService());
          cartBloc.add(CartsProductsEvent());
          return cartBloc;
        },
        child: CartContent(),
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartSucces) {
          if (state.carts.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 sütun
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.carts.length,
            itemBuilder: (context, index) {
              final cart = state.carts[index];

              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart ID: ${cart.id}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'User ID: ${cart.userId}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Date: ${cart.date}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView(
                              shrinkWrap: true,
                              children: state.cartProducts.map((product) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'Product name: ${product.title}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  subtitle: Text(
                                    'price: ${product.price}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is CartFail) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text("Unknown state"));
        }
      },
    );
  }
}
