import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CategoryExpenses {
  final String name;
  final double radius;
  final Color color;
  String title = '';
  final double value;

  CategoryExpenses({
    required this.name,
    required this.radius,
    required this.color,
    this.title = '',
    required this.value,
  });
}

List<CategoryExpenses> categoryExpensesData = [
  CategoryExpenses(
      name: "Bills", radius: 12, color: AppColor.primary, value: 200),
  CategoryExpenses(
      name: "Food & Drink", radius: 12, color: AppColor.error, value: 120),
  CategoryExpenses(
      name: "Transportation", radius: 12, color: AppColor.success, value: 100),
  CategoryExpenses(
      name: "Shopping", radius: 12, color: AppColor.black, value: 80),
  CategoryExpenses(
      name: "Groceries", radius: 12, color: AppColor.textSecondary, value: 150),
  CategoryExpenses(
      name: "Entertainment", radius: 12, color: AppColor.background, value: 180)
];

class CategoryIncome {
  final String name;
  final double radius;
  final Color color;
  String title = '';
  final double value;

  CategoryIncome({
    required this.name,
    required this.radius,
    required this.color,
    this.title = '',
    required this.value,
  });
}

List<CategoryIncome> categoryIncomeData = [
  CategoryIncome(
      name: "Salary", radius: 12, color: AppColor.primary, value: 2000),
  CategoryIncome(
      name: "Business", radius: 12, color: AppColor.error, value: 1200),
  CategoryIncome(
      name: "Investments", radius: 12, color: AppColor.success, value: 1000),
  CategoryIncome(name: "Gifts", radius: 12, color: AppColor.black, value: 800),
  CategoryIncome(
      name: "Freelancing",
      radius: 12,
      color: AppColor.textSecondary,
      value: 1500),
];
