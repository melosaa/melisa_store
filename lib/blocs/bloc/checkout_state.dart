part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutFail extends CheckoutState {
  final String errorMessage;
  const CheckoutFail(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class CheckoutSucces extends CheckoutState {
  final String checkout;
  const CheckoutSucces(this.checkout);

  @override
  List<Object> get props => [checkout];
}
