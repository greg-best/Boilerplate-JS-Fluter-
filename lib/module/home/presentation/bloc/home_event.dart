part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeCheckUsernamePressed extends HomeEvent {}

class HomeCheckPasswordPressed extends HomeEvent {}

class AuthenticationLoginWithGooglePressed extends HomeEvent {}
