import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String text;
  final String hintText;
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.text,
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
          cursorColor: ColorsApp.primary,
          decoration: InputDecoration(
            enabled: true,
            filled: true,
            fillColor: ColorsApp.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade600),
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
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: ColorsApp.white,
        width: 3,
      ));
}