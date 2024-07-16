import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/model/products_model.dart';
import 'package:melisa_store/services/home_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchProductsEvent>(_onFetchProductsEvent);
  }

  Future<void> _onFetchProductsEvent(
      FetchProductsEvent event, Emitter<HomeState> emit) async {
    emit(HomeProductsLoading());

    try {
      final products = await fetchProducts();
      emit(HomeProductsSucces(products: products));
    } catch (e) {
      emit(HomeProductsFail(errorMessage: e.toString()));
    }
  }
}