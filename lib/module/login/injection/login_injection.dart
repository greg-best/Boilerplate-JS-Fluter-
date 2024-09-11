
part of '../../injection_container.dart';

Future<void> loginInjection() async {
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      dio: sl(),
    ),
  );

  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoginBloc()
  );
}
