import 'package:flutter/material.dart';

class PasswordDialog extends StatelessWidget {
  const PasswordDialog({super.key});

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
