import 'package:boilerplate/module/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 500));
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Future.microtask(() {
                // context.go('/login');
                context.pop();
              });
            },
            icon: const Icon(
              Icons.navigate_before,
            ),
          ),
          title: const Text('Home'),
          centerTitle: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeUsernameSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Username: ${state.username}'),
                ),
              );
            }
            if (state is HomePasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Password: ${state.password}'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeCheckUsernamePressed());
                      },
                      child: const Text('Cek Username'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeCheckPasswordPressed());
                      },
                      child: const Text('Cek Password'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(AuthenticationLoginWithGooglePressed());
                      },
                      child: Text('Get Data'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
