import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomRowText({super.key, required this.text1, required this.text2, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: text1, style: AppTextStyle.montserrat500Style16),
          TextSpan(
              text: text2,
              style: AppTextStyle.montserrat500Style24.copyWith(fontSize: 16)),
        ])),
      ),
    );
  }
}
