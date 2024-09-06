part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends LoginEvent {}

class DecrementEvent extends LoginEvent {}
