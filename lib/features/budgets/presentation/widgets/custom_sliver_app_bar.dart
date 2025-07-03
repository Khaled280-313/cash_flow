import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Budgets'),
      pinned: true,
      floating: true,
      backgroundColor: AppColor.background,
      actions: [
        IconButton(
          icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: 30, color: AppColor.black)),
          onPressed: () {
            // Navigate to add budget page
            Navigator.pushNamed(context, '/addBudget');
          },
        ),
      ],
    );
  }
}