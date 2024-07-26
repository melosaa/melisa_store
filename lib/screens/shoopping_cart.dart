import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/blocs/bloc/cart_bloc.dart';
import 'package:melisa_store/blocs/home/bloc/home_bloc.dart';
import 'package:melisa_store/services/carts_services.dart';

@RoutePage()
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(cartsService: context.read<CartsService>())
        ..add(const CartsProductsEvent()),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartFail) {
              return Center(child: Text("Error: ${state.errorMessage}"));
            } else if (state is CartSucces) {
              // İsimlendirmeyi düzelttik
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.carts.length,
                    itemBuilder: (context, index) {},
                  ),
                ),
              );
            } else {
              return Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
