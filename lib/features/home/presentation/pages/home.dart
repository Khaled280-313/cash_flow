import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_chart.dart';
import '../widgets/sliver_app_bar_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBarHome(),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              CustomChart()
            ],
          ),
        ),
      ),
    );
  }
}



