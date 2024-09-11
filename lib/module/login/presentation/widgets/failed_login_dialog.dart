import 'package:flutter/material.dart';

class FailedLoginDialog extends StatelessWidget {
  const FailedLoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: const Text('Success'),
    );
  }
}
