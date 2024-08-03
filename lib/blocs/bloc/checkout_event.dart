part of 'checkout_bloc.dart';

class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class CheckoutProduct extends CheckoutEvent {
  final String checkout;
  const CheckoutProduct(this.checkout);

  @override
  List<Object> get props => [checkout];
}
