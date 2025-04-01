import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final void Function()? onPressed;
  const CustomBotton({
    super.key,
    required this.child,
    required this.height,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
          onPressed: onPressed,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: child),
    );
  }
}
