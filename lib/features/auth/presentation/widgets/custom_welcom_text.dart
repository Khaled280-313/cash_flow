
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class CustomWelcomText extends StatelessWidget {
  final String text1;
  final String? text2;
  const CustomWelcomText({super.key, required this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: AppTextStyle.kaushan400Style64.copyWith(fontSize: 35),
          ),
          Text(
            text2!,
            style: AppTextStyle.kaushan400Style64.copyWith(fontSize: 35),
          ),
        ],
      ),
    );
  }
}
