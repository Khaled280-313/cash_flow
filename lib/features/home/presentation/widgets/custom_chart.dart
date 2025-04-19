import 'package:cash_flow/features/home/presentation/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColor.background,
      child: CustomLineChart(),
    ));
  }
}
