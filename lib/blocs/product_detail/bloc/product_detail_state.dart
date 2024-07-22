part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailSucces extends ProductDetailState {
  const ProductDetailSucces(this.product);
  final Product product;
  @override
  List<Object> get props => [product];
}

class ProductDetailFail extends ProductDetailState {
  ProductDetailFail(this.errorMessage);
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
