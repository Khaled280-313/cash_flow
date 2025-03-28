import 'package:cash_flow/core/routes/app_routes.dart';
import 'package:cash_flow/core/utils/string.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: StringsApp.appName,
    );
  }
}
