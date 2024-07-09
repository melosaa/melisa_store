import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melisa_store/services/home_view_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchProductsEvent>(
        _onFetchProductsEvent as EventHandler<FetchProductsEvent, HomeState>);
  }

  Future<void> _onFetchProductsEvent() async {
    emit(HomeProductsLoading());

    try {
      final products = await fetchProducts();
      emit(HomeProductsSucces(products: products));
    } catch (e) {
      emit(HomeProductsFail(errorMessage: e.toString()));
    }
  }
}
