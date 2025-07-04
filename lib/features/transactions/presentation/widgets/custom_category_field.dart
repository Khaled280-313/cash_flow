import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomCategoryField extends StatefulWidget {
  final String hintText;
  const CustomCategoryField({
    super.key,
    required this.hintText,
  });

  @override
  State<CustomCategoryField> createState() => _CustomCategoryFieldState();
}

class _CustomCategoryFieldState extends State<CustomCategoryField> {
  List<String> category = [
    'Food',
    'Transport',
    'Shopping',
    'Bills',
    'Entertainment',
    'Health',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: DropdownButtonFormField<String>(
        dropdownColor: AppColor.white,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintText: widget.hintText,
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
        items: category.map((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle the change in selected category
        },
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
