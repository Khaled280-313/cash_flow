// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cash_flow/core/utils/colors_app.dart';

class CustomBotton extends StatelessWidget {
  final Widget child;
  final double height;
  final void Function()? onPressed;
  const CustomBotton({
    super.key,
    required this.child,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
          onPressed: onPressed,
          color: ColorsApp.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: child),
    );
  }
}
