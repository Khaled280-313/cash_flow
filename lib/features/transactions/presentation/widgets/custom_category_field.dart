import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomCategoryField extends StatefulWidget {
  final String hintText;
  final List<String> categories;
  final void Function(String?)? onChanged;

  const CustomCategoryField({
    super.key,
    required this.hintText,
    required this.categories,
    this.onChanged,
  });

  @override
  State<CustomCategoryField> createState() => _CustomCategoryFieldState();
}

class _CustomCategoryFieldState extends State<CustomCategoryField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: DropdownButtonFormField<String>(
        dropdownColor: AppColor.white,
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          alignLabelWithHint: true,
          disabledBorder: getBorderStyle(),
          hintText: widget.hintText,
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
          errorBorder: getBorderStyle().copyWith(
              borderSide: BorderSide(color: AppColor.error, width: 1.5)),
          focusedErrorBorder: getBorderStyle().copyWith(
              borderSide: BorderSide(color: AppColor.error, width: 1.5)),
        ),
        items: widget.categories.map((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: widget.onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a category';
          }
          return null;
        },
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
