import 'package:boilerplate/module/home/presentation/ui/home_screen.dart';
import 'package:boilerplate/module/loginscreen/presentation/bloc/login_bloc.dart';
import 'package:boilerplate/module/loginscreen/presentation/ui/loginscreen_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => Loginscreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => Home(),
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
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
