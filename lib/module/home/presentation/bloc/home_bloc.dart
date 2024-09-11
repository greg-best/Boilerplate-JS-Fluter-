import 'dart:async';

import 'package:boilerplate/common/models/auth/login_response.dart';
import 'package:boilerplate/core/error/error.dart';
import 'package:boilerplate/core/service/network_info.dart';
import 'package:boilerplate/module/home/data/datasource/home_datasource_remote.dart';
import 'package:boilerplate/module/home/data/repository/home_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../login/data/datasource/login_local_datasource.dart';
import '../../../login/data/repository/login_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoginRepository _loginRepository = LoginRepository(localDataSource: LoginLocalDataSourceImpl());
  final HomeRepository _homeRepository = HomeRepository(remoteDataSource: HomeRemoteDataSourceImpl(dio: Dio()), networkInfo: NetworkInfoImpl(Connectivity()));

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeCheckUsernamePressed>((event, emit) async {
      String resUsername = await _loginRepository.checkUsername();
      emit(HomeUsernameSuccess(username: resUsername));
    });

    on<HomeCheckPasswordPressed>((event, emit) async {
      String resPassword = await _loginRepository.checkPassword();
      emit(HomePasswordSuccess(password: resPassword));
    });

    // Google
    Future<GoogleSignInAccount?> _signInWithGoogle() async {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      return googleSignInAccount;
    }

    on<AuthenticationLoginWithGooglePressed>((event, emit) async {
      emit(HomeLogInInProgress());

      GoogleSignInAccount? googleSignInAccount = await _signInWithGoogle();

      if (googleSignInAccount == null) {
        emit(const HomeLogInFailure(
          errorMessage: "Goole Sign In Return Null",
        ));
        return;
      }

      final params = ParamsLoginSocmed(email: googleSignInAccount.email);

      final loginResult = await _homeRepository.loginEmailSocmed(params.email ?? '');

      emit(
        loginResult.fold(
          (failure) {
            var errorMessage = '';
            if (failure is ServerFailure) {
              errorMessage = failure.dataApiFailure.message ?? errorMessage;
              return HomeLoginSosmedFailure(
                email: googleSignInAccount.email,
                fullName: googleSignInAccount.displayName ?? '',
              );
            } else if (failure is ConnectionFailure) {
              errorMessage = failure.errorMessage;
            } else if (failure is ParsingFailure) {
              errorMessage = failure.errorMessage;
            }
            return HomeLogInFailure(
              errorMessage: errorMessage,
            );
          },
          (response) => HomeLogInSuccess(
            loginResponse: response,
          ),
        ),
      );
    });
  }
}
