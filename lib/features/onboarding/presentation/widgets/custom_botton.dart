// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cash_flow/core/utils/colors_app.dart';

class CustomBotton extends StatelessWidget {
  final Widget child;
  final double height;
  const CustomBotton({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(left: 20),
      child: MaterialButton(
          onLongPress: () {},
          onPressed: () {},
          color: ColorsApp.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: child),
    );
  }
}
