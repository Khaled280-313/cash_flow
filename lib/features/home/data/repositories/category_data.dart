import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class Category {
  final String name;
  final double radius;
  final Color color;
  String title = '';
  final double value;

  Category({
    required this.name,
    required this.radius,
    required this.color,
    this.title = '',
    required this.value,
  });
}

List<Category> categoryData = [
  Category(name: "Bills", radius: 12, color: AppColor.primary, value: 200),
  Category(name: "Food & Drink", radius: 12, color: AppColor.error, value: 120),
  Category(
      name: "Transportation", radius: 12, color: AppColor.success, value: 100),
  Category(name: "Shopping", radius: 12, color: AppColor.black, value: 80),
  Category(
      name: "Groceries", radius: 12, color: AppColor.textSecondary, value: 150),
  Category(
      name: "Entertainment", radius: 12, color: AppColor.background, value: 180)
];