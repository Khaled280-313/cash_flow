import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/budgets_data.dart';
import '../widgets/custom_budget_chart.dart';
import '../widgets/custom_budget_tile.dart';
import '../widgets/custom_sliver_app_bar.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: CustomBudgetChart(),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(26),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                          spreadRadius: 5)
                    ]),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 1,
                ),
                child: Column(
                  spacing: 15,
                  children: List.generate(budgetsData.length, (index) {
                    return CustomBudgetTile(data: budgetsData[index]);
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
