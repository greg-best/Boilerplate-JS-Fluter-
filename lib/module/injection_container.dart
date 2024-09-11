import 'package:boilerplate/module/home/data/datasource/home_datasource_local.dart';
import 'package:boilerplate/module/home/data/repository/home_repository.dart';
import 'package:boilerplate/module/home/presentation/bloc/home_bloc.dart';
import 'package:boilerplate/module/login/data/datasource/login_local_datasource.dart';
import 'package:boilerplate/module/login/data/datasource/login_remote_datasource.dart';
import 'package:boilerplate/module/login/presentation/bloc/login_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';

import '../core/service/network_info.dart';
import 'home/data/datasource/home_datasource_remote.dart';
import 'login/data/repository/login_repository.dart';

part 'home/injection/home_injection.dart';
part 'login/injection/login_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  loginInjection();
  homeInject();

  // core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => DeviceInfoPlugin());
}
