import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginHelper {
  static Future<dynamic> showSuccessLoginDialog(BuildContext context) {
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return const SuccessLoginDialog();
        });
  }

  static Future<dynamic> showFailedLoginDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return const FailedLoginDialog();
      },
    );
  }
}
