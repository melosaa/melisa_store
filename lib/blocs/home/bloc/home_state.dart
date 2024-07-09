part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeProductsLoading extends HomeState {}

class HomeProductsSucces extends HomeState {
  const HomeProductsSucces({required this.products});
  final List<Product> products;
  @override
  List<Object> get props => [products];
}

class HomeProductsFail extends HomeState {
  const HomeProductsFail({required this.errorMessage});
  final String errorMessage;
}
