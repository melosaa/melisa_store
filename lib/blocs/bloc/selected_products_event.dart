import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart' show Equatable;

sealed class SelectedProductsEvent extends Equatable {
  const SelectedProductsEvent();

  @override
  List<Object> get props => [];
}

class SelectedProducts extends SelectedProductsEvent {
  const SelectedProducts(this.size);
  final String size;

  @override
  List<Object> get props => [size];

  void add(SelectedProducts selectedProducts) {}
}
