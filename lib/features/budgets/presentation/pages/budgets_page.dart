import 'package:cash_flow/core/utils/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/budgets_data.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: CustomBudgetChart(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBudgetChart extends StatefulWidget {
  const CustomBudgetChart({
    super.key,
  });

  @override
  State<CustomBudgetChart> createState() => _CustomBudgetChartState();
}

class _CustomBudgetChartState extends State<CustomBudgetChart> {
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
          ),
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
                      centerSpaceRadius: 40,
                      centerSpaceColor: AppColor.white,
                      sections: List.generate(budgetsData.length, (index) {
                        final isTouched = index == touchedIndex;
                        final fontSize = isTouched ? 25.0 : 16.0;
                        final radius = isTouched ? 60.0 : 50.0;
                        // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                        final data = budgetsData[index];
                        return PieChartSectionData(
                          color: data.color,
                          value: data.value,
                          radius: radius,
                          title: '${(data.value / 1000) * 100}%',
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

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Budgets'),
      pinned: true,
      floating: true,
      backgroundColor: AppColor.background,
      actions: [
        IconButton(
          icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: 30, color: AppColor.black)),
          onPressed: () {
            // Navigate to add budget page
            Navigator.pushNamed(context, '/addBudget');
          },
        ),
      ],
    );
  }
}
