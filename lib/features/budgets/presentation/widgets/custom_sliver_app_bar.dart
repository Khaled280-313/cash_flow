import 'package:animations/animations.dart';
import 'package:cash_flow/features/budgets/presentation/pages/add_budgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(S.of(context).budgets),
      pinned: true,
      floating: true,
      backgroundColor: AppColor.background,
      actions: [
        OpenContainer(
          closedColor: AppColor.background,
          closedElevation: 0,
          transitionType: ContainerTransitionType.fadeThrough,
          transitionDuration: const Duration(milliseconds: 300),
          closedBuilder: (context, action) => IconButton(
            icon: const Icon(Icons.add),
            onPressed: action,
          ),
          openBuilder: (context, action) => AddBudgets(),
        )
      ],
    );
  }
}
