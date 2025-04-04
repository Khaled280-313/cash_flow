import 'package:cash_flow/app/my_app.dart';
import 'package:cash_flow/core/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure that plugin services are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the service locator and cache helper
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
