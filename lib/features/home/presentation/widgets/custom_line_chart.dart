import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/function/format_amount.dart';
import '../../../../core/function/get_date_title.dart';
import '../../../../core/utils/app_color.dart';
import '../../data/repositories/data.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({
    super.key,
  });

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late List<double> amounts;
  late List<double> top5;
  late double interval;
  late double minValue;
  late double maxValue;
  void _initializeChartData() {
// 1. استخراج القيم وحذف التكرارات
    amounts = dailyExpenses.map((e) => e.amount).toList().toSet().toList();

    // 2. ترتيب تنازلي واختيار أكبر 5 قيم
    amounts.sort((a, b) => b.compareTo(a));
    top5 = amounts.length >= 5 ? amounts.sublist(0, 5) : amounts;
    top5.sort(); // ترتيب تصاعدي للعرض

    // 3. حساب المدى الكلي للقيم المختارة
    minValue = top5.isNotEmpty ? top5.first : 0;
    maxValue = top5.isNotEmpty ? top5.last : 0;

    // 4. حساب الفاصل الثابت بناءً على المدى الكلي
    if (minValue == maxValue) maxValue += 100; // تجنب القسمة على صفر
    interval = (maxValue - minValue) / 4;
  }

  bool _isValueInRange(double value, double epsilon) {
    // 6. التحقق من وجود القيمة في المدى المطلوب
    return value >= (minValue - epsilon) && value <= (maxValue + epsilon);
  }

  @override
  void initState() {
    super.initState();
    _initializeChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: AppColor.white,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: LineChart(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        LineChartData(
            titlesData: FlTitlesData(
                topTitles: AxisTitles(),
                rightTitles: AxisTitles(drawBelowEverything: false),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60, // زيادة المساحة
                      interval: interval,
                      getTitlesWidget: (value, meta) {
                        final epsilon = interval * 0.01;
                        final exists = _isValueInRange(value, epsilon);
                        return exists
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  right: 8.0,
                                ),
                                child: Text(
                                  formatAmount(value),
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                            : SizedBox.shrink();
                      }),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    reservedSize: 20,
                    getTitlesWidget: (value, _) => getDateTitle(value.toInt()),
                  ),
                )),
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                tooltipRoundedRadius: 10,
                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      "${spot.x.toInt()} : ${formatAmount(spot.y)}",
                      TextStyle(
                        color: AppColor.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: true,
              border: Border(),
            ),
            backgroundColor: AppColor.white,
            lineBarsData: [
              LineChartBarData(
                isStrokeCapRound: false,
                isStrokeJoinRound: false,
                isStepLineChart: false,
                preventCurveOverShooting: true,
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

                spots: _convertToSpots(),
                isCurved: true,
                color: AppColor.primary,
                dotData: FlDotData(show: false),

                // إظهار النقاط
              )
            ]),
      ),
    );
  }
}

List<FlSpot> _convertToSpots() {
  return dailyExpenses
      .asMap()
      .entries
      .map(
        (entry) => FlSpot(entry.key.toDouble(), entry.value.amount),
      )
      .toList();
}
