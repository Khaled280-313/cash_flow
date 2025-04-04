import 'package:cash_flow/core/routes/app_routes.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // SizeConfig().init(context);
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.background,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}