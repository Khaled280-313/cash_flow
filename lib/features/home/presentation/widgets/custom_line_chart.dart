import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../data/repositories/data.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      duration: Duration(milliseconds: 150), // Optional
      curve: Curves.linear,
      LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: AppColor.primary, width: 2.5),
              left: BorderSide(color: AppColor.primary, width: 2.5),
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(),
            rightTitles: AxisTitles(drawBelowEverything: false),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          ),
          backgroundColor: AppColor.background,
          lineBarsData: [
            LineChartBarData(
              // هنا نستخدم isCurved لجعل الخط منحنيًا
              isCurved: true,

              belowBarData: BarAreaData(
                show: true,
                color: AppColor.primary.withAlpha(150),
                gradient: LinearGradient(
                  colors: [
                    AppColor.primary.withAlpha(150),
                    AppColor.primary.withAlpha(50)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              //هنا نستخدم FlDotData لإخفاء النقاط على الخط
              dotData: FlDotData(show: false),

              spots: dailyExpenses
                  .map((e) => FlSpot(e.date.day.toDouble(), e.amount))
                  .toList(),
              color: AppColor.primary,
            ),
          ]),
    );
  }
}
