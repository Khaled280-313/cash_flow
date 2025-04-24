import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/features/home/presentation/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';
import '../../data/repositories/data.dart';
import 'custom_title_chart.dart';

class CustomChart extends StatelessWidget {
  final double totalAmount =
      dailyExpenses.fold(0, (sum, expense) => sum + expense.amount);

  CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 235,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleChart(),
              Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text("${totalAmount.toString()} \$",
                      style: AppTextStyle.montserratBoldStyle20)),
              CustomLineChart(),
            ]),
      ),
    );
  }
}
