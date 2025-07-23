import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  const CustomSnackBar({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
    return SizedBox.shrink();
  }
}
