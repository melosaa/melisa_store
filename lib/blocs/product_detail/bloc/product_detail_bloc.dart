import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/services/product_detail_service.dart';

import '../../../model/products_model.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<FetchProductsEvent>(_onProductDetailFetchEvent);
  }

  Future<void> _onProductDetailFetchEvent(
      FetchProductsEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      final productDetail = await fetchProductDetail(event.id);
      emit(ProductDetailSucces(productDetail));
    } catch (e) {
      emit(ProductDetailFail(e.toString()));
    }
  }
}
