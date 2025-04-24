<<<<<<< HEAD
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
=======
import 'package:cash_flow/features/home/presentation/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({
    super.key,
  });
>>>>>>> 6e8b6d927ff5786f0a964bd04d9f8cca989f8f0d

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
<<<<<<< HEAD
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
=======
        child: Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColor.background,
      child: CustomLineChart(),
    ));
>>>>>>> 6e8b6d927ff5786f0a964bd04d9f8cca989f8f0d
  }
}
