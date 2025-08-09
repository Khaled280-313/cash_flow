import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    bool isAuthVisited =
        getIt<CacheHelper>().getData(key: "isAuthVisited") ?? false;
    if (isAuthVisited == true) {
      delayedNavigator(context, "/BottomNavigation");
    } else if (isOnBoardingVisited == true) {
      delayedNavigator(context, "/SignUp");
    } else {
      delayedNavigator(context, "/onboarding");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Text(
          S.of(context).appName,
          style: AppTextStyle.kaushan400Style64,
        ),
      ),
    );
  }
}
