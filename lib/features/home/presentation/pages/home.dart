import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_chart.dart';
import '../widgets/custom_chart_category.dart';
import '../widgets/custom_widget_cash_flow.dart';
import '../widgets/custum_widget_acount.dart';
import '../widgets/sliver_app_bar_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBarHome(),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            CustomChart(),
            CustumWidgetAcount(),
            CustomWidegtCashFlow(),
            BlocProvider(
              create: (context) => HomeCubit(),
              child: CustomChartCategory(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }
}
