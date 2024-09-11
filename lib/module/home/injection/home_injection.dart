part of '../../injection_container.dart';

Future<void> homeInject() async {
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      dio: sl(),
    ),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => sl<HomeLocalDataSourceImpl>(),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(),
  );
}
