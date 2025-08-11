import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        tileColor: AppColor.white,
        trailing: Icon(Icons.logout, color: AppColor.error),
        title: const Text(AppStrings.logout,
            style: TextStyle(color: AppColor.error)),
        onTap: () {
          // Handle logout functionality
          // For example, you might want to clear user data and navigate to the login screen
          // Navigator.pushReplacementNamed(context, '/login');
          getIt<CacheHelper>().clearData(key: "isAuthVisited");
          customNavigatPushReplacement(context: context, path: '/SignIn');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppStrings.logout),
              backgroundColor: AppColor.error,
            ),
          );
          // Here you can add your logout logic, like clearing user data or tokens
        },
      ),
    );
  }
}
