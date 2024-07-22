part of 'product_detail_bloc.dart';

class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends ProductDetailEvent {
  const FetchProductsEvent(this.id);
  final int id;
  @override
  List<Object> get props => [id];
}
