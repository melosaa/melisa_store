import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:melisa_store/blocs/bloc/selected_products_event.dart';

import 'selected_products_state.dart';

class SelectedProductsBloc
    extends Bloc<SelectedProductsEvent, SelectedProductsState> {
  SelectedProductsBloc() : super(SelectedProductsLoading());

  @override
  Stream<SelectedProductsState> mapEventToState(
      SelectedProductsEvent event) async* {
    if (event is SelectedProducts) {
      yield SelectedProductsSuccess(event.size);
    }
  }
}
