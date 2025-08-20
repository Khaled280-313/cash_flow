import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/analytics/presentation/widgets/custom_chart_analysis.dart';
import 'package:cash_flow/features/analytics/presentation/widgets/custom_widget_avarge.dart';
import 'package:cash_flow/features/analytics/presentation/widgets/custom_widget_cash_flow_analysis.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(padding: EdgeInsetsGeometry.all(20)),
          CustomChartAnalysis(),
          SliverPadding(padding: EdgeInsetsGeometry.all(10)),
          CustomWidgetCashFlowAnalysis(),
          SliverPadding(padding: EdgeInsetsGeometry.all(10)),
          CustomWidgetAvarge()
        ],
      ),
    );
  }
}
