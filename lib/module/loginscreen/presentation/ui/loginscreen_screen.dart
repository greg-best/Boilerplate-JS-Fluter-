import 'package:boilerplate/main.dart';
import 'package:boilerplate/module/common/button/app_button.dart';
import 'package:boilerplate/module/loginscreen/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({
    super.key,
  });

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  //Example Bloc
  // final employeeBloc = sl<GetEmployeeV2Bloc>();
  // final employeeLocalDataSource = sl<EmployeeLocalDataSource>();

  // Example ValueNotifier
  // final totalFilter = ValueNotifier<int>(0);

  //Example Controller
  // final pagingController =
  //     PagingController<int, ContentEmployee>(firstPageKey: 1);

  //Example Other
  // final GlobalKey _bottomSheetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 500));
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Counter Bloc')),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Counter: ${state.counter}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton.primary(
                    text: "to Home",
                    name: "",
                    context: context,
                    onPressed: () {
                      Future.microtask(() {
                        context.push("/home");
                      });
                    },
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'uniqueTag1',
              onPressed: () {
                context.read<LoginBloc>().add(IncrementEvent());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'uniqueTag2',
              onPressed: () {
                context.read<LoginBloc>().add(DecrementEvent());
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
