import 'package:cash_flow/core/cache/cache_helper.dart';
import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        CacheHelper().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisited == true) {
      delayedNavigator(context, "/SignUp");
    } else {
      delayedNavigator(context, "/onboarding");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStyle.kaushan400Style64,
        ),
      ),
    );
  }
}
