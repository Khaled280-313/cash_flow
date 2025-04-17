import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomRow({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 40, right: 10, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyle.kaushan400Style64.copyWith(fontSize: 30),
          ),
          CustomBotton(
              height: 50,
              onPressed: onPressed,
              color: AppColor.primary,
              child: Icon(
                Icons.arrow_forward,
                color: AppColor.white,
                size: 30,
              ))
        ],
      ),
    );
  }
}
