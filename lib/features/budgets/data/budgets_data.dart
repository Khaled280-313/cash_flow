import 'package:flutter/material.dart';

class BudgetsData {
  final String title;
  final double value;
  final Color color;
  final IconData? icon;

  BudgetsData({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });
}

List<BudgetsData> budgetsData = [
  BudgetsData(
      title: "College",
      value: 20000,
      color: Colors.red,
      icon: Icons.blinds_outlined),
  BudgetsData(
      title: "Transportation",
      value: 10000,
      color: Colors.blue,
      icon: Icons.airport_shuttle_outlined),
  BudgetsData(
      title: "Housing",
      value: 30000,
      color: Colors.green,
      icon: Icons.house_outlined),
  BudgetsData(
      title: "Coffee", value: 5000, color: Colors.orange, icon: Icons.coffee),
  BudgetsData(
      title: "Breakfast",
      value: 15000,
      color: Colors.purple,
      icon: Icons.food_bank_outlined),
];
// List<BudgetsData> budgetsDataGenerator(int count) {
//   return List.generate(count, (index) {
//     return BudgetsData(
//       title: "Budget ${index + 1}",
//       value: (index + 1) * 100.0,
//       color: Colors.primaries[index % Colors.primaries.length],
//     );
//   });
// }
