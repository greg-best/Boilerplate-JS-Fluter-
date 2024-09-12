import 'dart:async';

import 'package:alice/alice.dart';
import 'package:boilerplate/common/helpers/device_helper.dart';
import 'package:boilerplate/config/config.dart';
import 'package:boilerplate/module/home/presentation/bloc/home_bloc.dart';
import 'package:boilerplate/module/home/presentation/ui/home_screen.dart';
import 'package:boilerplate/module/login/presentation/bloc/login_bloc.dart';
import 'package:boilerplate/module/login/presentation/ui/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/route_constant.dart';
import 'module/injection_container.dart' as di;

main() async {
  EnvConfig.flavor = Flavor.development;
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await di.init();
    di.sl.allowReassignment = true;

    // Store device id to local data
    await DeviceHelper().initialId();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(
        DevicePreview(
          enabled: true,
          builder: (context) => App(),
        ),
      ),
    );
  }, (error, stack) async {
    if (kDebugMode) {
      print("error $error");
    }
  });
}

class App extends StatelessWidget {
  Alice alice = Alice(showNotification: true);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/home',
      navigatorKey: alice.getNavigatorKey(),
      routes: [
        GoRoute(
          path: RouteConstant().login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RouteConstant().home,
          builder: (context, state) => const Home(),
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Flutter BLoC with GoRouter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
