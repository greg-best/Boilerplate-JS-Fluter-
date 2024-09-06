part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int counter;

  LoginState({required this.counter});

  @override
  List<Object> get props => [counter];
}

final class LoginInitial extends LoginState {
  LoginInitial({required super.counter});
}
