part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartsProductsEvent extends CartEvent {}
class AddToCartEvent extends CartEvent {
  final int productId;

  const AddToCartEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}
