import 'package:cash_flow/app/my_app.dart';
import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  // هنا نستخدم WidgetsFlutterBinding.ensureInitialized() للتأكد من أن كل شيء جاهز قبل بدء التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the service locator and cache helper
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  // await getIt<DatabaseHelper>().database;

  runApp(const MyApp());
  
}
