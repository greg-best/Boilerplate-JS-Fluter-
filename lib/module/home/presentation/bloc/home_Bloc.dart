
// counter_bloc.dart
import 'dart:async';
import 'package:boilerplate/module/home/presentation/bloc/home_Event.dart';
import 'package:boilerplate/module/home/presentation/bloc/home_State.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc< HomeEvent,  HomeState> {
   HomeBloc() : super( HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    // on<IncrementEvent>((event, emit) {
    //   print(state.counter.toString());
    //   final newState = LoginState(counter: state.counter + 1);
    //   emit(newState);
    // });

    // on<DecrementEvent>((event, emit) {
    //   final newState = LoginState(counter: state.counter - 1);
    //   emit(newState);
    // });
  }
}



