import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/model/user_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/services/carts_services.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartsService cartsService;

  CartBloc({required this.cartsService}) : super(CartInitial()) {
    on<CartEvent>(_onCartProductsEvent as EventHandler<CartEvent, CartState>);
  }

  Future<void> _onCartProductsEvent(
      CartsProductsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());

    try {
      final carts = await cartsService.fetchCarts();
      emit(CartSucces(carts: carts));
    } catch (e) {
      emit(CartFail(errorMessage: e.toString()));
    }
  }
}
