import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/analytics/presentation/pages/analytics_page.dart';
import 'package:cash_flow/features/budgets/presentation/pages/budgets_page.dart';

import 'package:cash_flow/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../transactions/presentation/pages/transactions_page.dart';

class BottomNavigationBarHome extends StatelessWidget {
  BottomNavigationBarHome({super.key});
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style3,
      backgroundColor: AppColor.white,
      navBarHeight: 65,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        colorBehindNavBar: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.textSecondary,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    Home(),
    TransactionsPage(),
    BudgetsPage(),
    AnalyticsPage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: AppStrings.home,
      activeColorPrimary: AppColor.primary,
      inactiveColorPrimary: AppColor.textSecondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.content_paste_sharp),
      title: AppStrings.transactions,
      activeColorPrimary: AppColor.primary,
      inactiveColorPrimary: AppColor.textSecondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.pie_chart),
      title: AppStrings.budgets,
      activeColorPrimary: AppColor.primary,
      inactiveColorPrimary: AppColor.textSecondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.analytics),
      title: AppStrings.analytics,
      activeColorPrimary: AppColor.primary,
      inactiveColorPrimary: AppColor.textSecondary,
    )
  ];
}
