import 'package:cash_flow/core/routes/app_routes.dart';
import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
          title: StringsApp.appName,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsApp.white,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
