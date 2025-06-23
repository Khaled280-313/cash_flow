import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomCntainTogle extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color? selectedColor;

  const CustomCntainTogle({
    super.key,
    required this.text,
    required this.isSelected,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor ?? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? AppColor.white : AppColor.textPrimary,
        ),
      ),
    );
  }
}