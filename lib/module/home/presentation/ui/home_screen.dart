import 'package:flutter/material.dart';
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Future.microtask(() {
                // context.go('/login');
                context.pop();
              });
            },
            icon: Icon(
              Icons.navigate_before,
            ),
          ),
          title: Text('Home'),
          centerTitle: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: const SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
