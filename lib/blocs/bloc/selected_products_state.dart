import 'package:equatable/equatable.dart';

abstract class SelectedProductsState extends Equatable {
  const SelectedProductsState();

  @override
  List<Object> get props => [];
}

class SelectedProductsLoading extends SelectedProductsState {}

class SelectedProductsFail extends SelectedProductsState {
  final String errorMessage;

  SelectedProductsFail(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SelectedProductsSuccess extends SelectedProductsState {
  final String selectedSize;

  const SelectedProductsSuccess(this.selectedSize);

  @override
  List<Object> get props => [selectedSize];
}
