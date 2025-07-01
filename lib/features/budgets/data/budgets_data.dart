import 'package:flutter/material.dart';

class BudgetsData {
  final String title;
  final double value;
  final Color color;

  BudgetsData({
    required this.title,
    required this.value,
    required this.color,
  });
}

List<BudgetsData> budgetsData = [
  BudgetsData(title: "College", value: 300, color: Colors.red),
  BudgetsData(title: "Transportation", value: 150, color: Colors.blue),
  BudgetsData(title: "Housing", value: 200, color: Colors.green),
  BudgetsData(title: "Coffee", value: 100, color: Colors.orange),
  BudgetsData(title: "Breakfast", value: 250, color: Colors.purple),
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
