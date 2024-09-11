import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeHelper {
  static Future<dynamic> showUsernameDialog(
    BuildContext context, {
    required String username,
  }) {
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return const UsernameDialog();
        });
  }

  static Future<dynamic> showPasswordDialog(
    BuildContext context, {
    required String password,
  }) {
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return const PasswordDialog();
        });
  }
}
