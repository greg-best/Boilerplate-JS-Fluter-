part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  final String? username, password;
  const LoginButtonPressedEvent({this.username, this.password});
}
