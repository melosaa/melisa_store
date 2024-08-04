import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/model/add_to_cart_response_model.dart';
import 'package:melisa_store/model/products_model.dart';

import 'package:melisa_store/services/carts_services.dart';
import 'package:melisa_store/services/home_view_screen.dart';

import '../../model/user_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartsService cartsService;

  CartBloc({required this.cartsService}) : super(CartInitial()) {
    on<CartsProductsEvent>(_onCartsProductsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
  }

  Future<void> _onAddToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    try {
      emit(AddToCartLoading());
      final addToCartResponse =
          await cartsService.addToCart(event.productId);
      emit(AddToCartSuccess( addToCartResponseModel: addToCartResponse));

    } catch (e) {
      emit(AddToCartFail(errorMessage: e.toString()));
    }
  }


  Future<void> _onCartsProductsEvent(
      CartsProductsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      // Fetch all carts
      final carts = await cartsService.fetchCarts();
      final products = await fetchProducts();

      if (carts.isNotEmpty) {
        carts.sort((a, b) =>
            DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));

        final mostRecentCart = carts.first;

        final cartProductsIds = mostRecentCart.products!
            .map((product) => product.productId)
            .toList();

        final List<Product> cartProducts = products.where((product) {
          return cartProductsIds.contains(product.id);
        }).toList();

        cartProducts.forEach((item) => print(item.price));

        emit(CartSucces(carts: [mostRecentCart], cartProducts: cartProducts));
      } else {
        emit(CartFail(errorMessage: 'No carts available'));
      }
    } catch (e) {
      emit(CartFail(errorMessage: e.toString()));
    }
  }

  // Future<void> _onCartsProductsEvent(
  //     CartsProductsEvent event, Emitter<CartState> emit) async {
  //   emit(CartLoading());
  //   try {
  //     final carts = await cartsService.fetchCarts();

  //     print(carts);
  //     emit(CartSucces(carts: carts));
  //   } catch (e) {
  //     emit(CartFail(errorMessage: e.toString()));
  //   }
  // }
}
