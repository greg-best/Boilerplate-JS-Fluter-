part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();
}

final class LoginFailed extends LoginState {
  const LoginFailed();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}
