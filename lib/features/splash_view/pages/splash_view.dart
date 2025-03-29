import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigator(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          StringsApp.appName,
          style: AppTextStyle.kaushan400Style64,
        ),
      ),
    );
  }
}

void delayedNavigator(context) {
  Future.delayed(Duration(seconds: 2),
      () => customNavigat(context: context, path: '/onboarding'));
}
