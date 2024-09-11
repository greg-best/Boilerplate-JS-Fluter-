import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasource/login_local_datasource.dart';
import '../../data/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository = LoginRepository(localDataSource: LoginLocalDataSourceImpl());

  LoginBloc() : super(const LoginInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(const LoginLoading());
      await _repository.saveLogin(event.username!, event.password!);
      final resLogin = await _repository.login(event.username!, event.password!);
      if (resLogin) {
        emit(const LoginSuccess());
      } else {
        emit(const LoginFailed());
      }
    });
  }
}
