
part of '../injection_container.dart';

Future<void> applicationInject() async {
  //ExampleRemote Datasource
  // sl.registerLazySingleton<ApplicationRemoteDataSource>(
  //   () => ApplicationRemoteDataSourceImpl(
  //     dio: sl(),
  //   ),
  // );

  //Local Datasource

  //Example Repository
  // sl.registerLazySingleton<ApplicationRepository>(
  //   () => ApplicationRepositoryImpl(
  //     remoteDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );

  //Example Bloc
  // sl.registerFactory(
  //   () => ApplicationBloc(
  //     getApplyHistory: sl(),
  //   ),
  // );

}
