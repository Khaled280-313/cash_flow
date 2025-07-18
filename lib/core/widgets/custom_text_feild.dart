// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cash_flow/core/utils/app_color.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String hintText;
  final bool suffixIcon;
  final bool obscureText;
  final bool? isDense;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.onFieldSubmitted,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.textInputType == TextInputType.multiline ? 50 : null,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: (widget.obscureText && isObscure),
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.textInputType,
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        isDense: (widget.isDense != null) ? widget.isDense : false,
        enabled: true,
        filled: true,
        fillColor: AppColor.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColor.textSecondary),
        suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  isObscure
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_outlined,
                  color: AppColor.primary,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
        suffixIconConstraints: (widget.isDense != null)
            ? const BoxConstraints(maxHeight: 33)
            : null,
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
        errorBorder: getBorderStyle().copyWith(
            borderSide: BorderSide(color: AppColor.error, width: 1.5)),
        focusedErrorBorder: getBorderStyle().copyWith(
            borderSide: BorderSide(color: AppColor.error, width: 1.5)),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: AppColor.textSecondary,
        width: 1,
      ));
}
