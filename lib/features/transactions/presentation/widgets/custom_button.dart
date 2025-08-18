import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
class CustomButton extends StatelessWidget {
  final void Function()? onPressed ;
  final Widget? child;
  const CustomButton({
    super.key, this.onPressed, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: 343,
      height: 56,
      child: child,
    );
  }
}