import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String text;
  final String hintText;
  final TextInputType textInputType;
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.text,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
          child: Text(text),
        ),
        TextField(
          keyboardType: textInputType,
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            enabled: true,
            filled: true,
            fillColor: AppColor.white,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColor.textSecondary),
            enabledBorder: getBorderStyle(),
            focusedBorder: getBorderStyle(),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColor.white,
        width: 3,
      ));
}
