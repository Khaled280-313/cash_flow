import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../data/budgets_data.dart';

class CustomCategoryChart extends StatefulWidget {
  const CustomCategoryChart({
    super.key,
  });

  @override
  State<CustomCategoryChart> createState() => _CustomCategoryChartState();
}

class _CustomCategoryChartState extends State<CustomCategoryChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.3,
        child: Container(
          margin: const EdgeInsets.all(10),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    PieChartData(
                      borderData: FlBorderData(
                        show: false,
                      ),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 20,
                      centerSpaceColor: AppColor.white,
                      sections: List.generate(budgetsData.length, (index) {
                        final isTouched = index == touchedIndex;
                        final fontSize = isTouched ? 25.0 : 16.0;
                        final radius = isTouched ? 90.0 : 70.0;
                        final data = budgetsData[index];
                        return PieChartSectionData(
                          color: data.color,
                          value: data.value,
                          radius: radius,
                          title:
                              '${((2000 / data.value) * 100).toStringAsFixed(0)}%',
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: isTouched ? AppColor.white : AppColor.black,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  spacing: 3,
                  children: List.generate(budgetsData.length, (index) {
                    final data = budgetsData[index];
                    return Row(
                      spacing: 5,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: data.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
