part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeProductsLoading extends HomeState {}

class HomeProductsSucces extends HomeState {
  final List<Product> products;

  const HomeProductsSucces({required this.products});

  @override
  List<Object> get props => [products];
}

class HomeProductsFail extends HomeState {
  final String errorMessage;

  const HomeProductsFail({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}