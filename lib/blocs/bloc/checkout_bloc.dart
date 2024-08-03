import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoading()) {
    on<CheckoutProduct>((event, emit) {
      emit(CheckoutLoading());

      try {
        Future.delayed(const Duration(seconds: 1));
        print("bloc çağrılsı");
        emit(CheckoutSucces(event.checkout));
      } catch (e) {
        emit(CheckoutFail(e.toString()));
      }
    });
  }
}
