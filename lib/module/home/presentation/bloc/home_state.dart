part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

// Home Username
final class HomeUsernameOnProgress extends HomeState {}

final class HomeUsernameFailure extends HomeState {
  final String errorMessage;

  const HomeUsernameFailure({required this.errorMessage});
}

final class HomeUsernameSuccess extends HomeState {
  final String username;

  const HomeUsernameSuccess({required this.username});
}

// Home Password
final class HomePasswordOnProgress extends HomeState {}

final class HomePasswordFailure extends HomeState {
  final String errorMessage;

  const HomePasswordFailure({required this.errorMessage});
}

final class HomePasswordSuccess extends HomeState {
  final String password;

  const HomePasswordSuccess({required this.password});
}

// Home Login
class HomeLogInInProgress extends HomeState {}

class HomeLogInSuccess extends HomeState {
  final LoginResponse loginResponse;

  const HomeLogInSuccess({
    required this.loginResponse,
  });

  @override
  List<Object> get props => [loginResponse];

  @override
  String toString() {
    return 'HomeLogInSuccess{loginResponse: $loginResponse}';
  }
}

class HomeLogInFailure extends HomeState {
  final String errorMessage;

  const HomeLogInFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'HomeLogInFailure{errorMessage: $errorMessage}';
  }
}

class HomeLoginSosmedFailure extends HomeState {
  final String email;
  final String fullName;

  const HomeLoginSosmedFailure({
    required this.email,
    required this.fullName,
  });

  @override
  String toString() {
    return 'AuthenticationLoginSosmedFailure{email: $email, fullName: $fullName}';
  }

  @override
  List<Object> get props => [email, fullName];
}
