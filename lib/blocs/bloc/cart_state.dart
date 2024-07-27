part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSucces extends CartState {
  final List<CartModel> carts;
  final List<Product> cartProducts;
  const CartSucces({required this.carts, required this.cartProducts});
  @override
  List<Object> get props => [carts, cartProducts];
}

final class CartFail extends CartState {
  final String errorMessage;
  CartFail({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
