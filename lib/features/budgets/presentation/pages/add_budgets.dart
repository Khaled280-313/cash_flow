import 'package:flutter/material.dart';

class AddBudgets extends StatelessWidget {
  const AddBudgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budgets'),
      ),
      body: Center(
        child: Text(
          'Add your budget details here',
        ),
      ),
    );
  }
}
