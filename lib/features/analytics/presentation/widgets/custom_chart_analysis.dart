import 'package:cash_flow/features/analytics/presentation/widgets/custom_line_chart_analysis.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../home/data/repositories/data.dart';

class CustomChartAnalysis extends StatelessWidget {
  final double totalAmount =
      dailyExpenses.fold(0, (sum, expense) => sum + expense.amount);

  CustomChartAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 10,
              offset: const Offset(5, 5),
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLineChartAnalysis(
                data: dailyExpenses,
              ),
            ]),
      ),
    );
  }
}
