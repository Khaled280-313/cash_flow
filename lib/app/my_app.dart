import 'package:cash_flow/core/routes/app_routes.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/core/utils/app_theme.dart' show AppTheme;
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
          // title: AppStrings.appName,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          // themeMode: ThemeMode.system,
        );
      },
    );
  }
}
