import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/home/data/repositories/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/sliver_app_bar_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBarHome(),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            CustomLineChart()
          ],
        ),
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 180,
        width: double.infinity,
        color: AppColor.textSecondary,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: dailyExpenses.map((expense) {
                  return FlSpot(
                    expense.date.day.toDouble(), // المحور X (اليوم)
                    expense.amount, // المحور Y (المبلغ)
                  );
                }).toList(),
                isCurved: true, // جعل الخط منحنيًا
                color: Colors.green,
                dotData: FlDotData(show: true), // إظهار النقاط
              ),
            ],
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text("${value.toInt()}"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
