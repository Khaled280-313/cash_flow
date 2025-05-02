import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/function/format_amount.dart';
import '../../../../core/function/get_date_title.dart';
import '../../../../core/utils/app_color.dart';

class CustomLineChart extends StatefulWidget {
  final List data;
  const CustomLineChart({
    super.key,
    required this.data,
  });

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late List<double> amounts;
  late Set<double> uniqueAmounts;
  late List<double> sortedDescending;
  late List<double> top5;
  late double interval;

  void _initializeChartData() {
    amounts = widget.data.map((e) => e.amount as double).toList();
    uniqueAmounts = amounts.toSet();

    sortedDescending = uniqueAmounts.toList()..sort((a, b) => b.compareTo(a));

    // حساب القيم النظرية المتساوية
    final double minVal = sortedDescending.isEmpty ? 0 : sortedDescending.last;
    final double maxVal = sortedDescending.isEmpty ? 0 : sortedDescending.first;
    top5 = _calculateEqualSteps(minVal, maxVal);

    interval = (maxVal - minVal) / 4; // خطوات متساوية
  }

  List<double> _calculateEqualSteps(double min, double max) {
    if (min >= max) return [min];
    final step = (max - min) / 4;
    return [
      min,
      min + step,
      min + 2 * step,
      min + 3 * step,
      max,
    ];
  }

  @override
  void initState() {
    super.initState();
    _initializeChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
                      reservedSize: 60,
                      interval: interval,
                      maxIncluded: false,
                      getTitlesWidget: (value, meta) {
                        // final formattedValue = formatAmount(value);
                        return Padding(
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
                            ));
                        // : SizedBox.shrink();
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

                spots: _convertToSpots(widget.data),
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

List<FlSpot> _convertToSpots(List data) {
  return data
      .asMap()
      .entries
      .map(
        (entry) => FlSpot(entry.key.toDouble(), entry.value.amount),
      )
      .toList();
}
