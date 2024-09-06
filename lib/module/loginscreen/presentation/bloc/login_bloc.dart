import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(counter: 0)) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IncrementEvent>((event, emit) {
      print(state.counter.toString());
      final newState = LoginState(counter: state.counter + 1);
      emit(newState);
    });

    on<DecrementEvent>((event, emit) {
      final newState = LoginState(counter: state.counter - 1);
      emit(newState);
    });
  }
}
