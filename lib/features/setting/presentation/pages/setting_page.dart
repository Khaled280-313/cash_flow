import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_logout.dart';
import '../widgets/custom_profil.dart';
import '../widgets/custom_setting_app.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.settings),
          backgroundColor: AppColor.background,
        ),
        body: Container(
          color: AppColor.background,
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(AppStrings.profile),
              ),
              CustomProfil(),
              Padding(padding: EdgeInsetsGeometry.all(7)),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(AppStrings.app),
              ),
              CustomSettingApp(),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CustomLogout(),
              ),
            ],
          ),
        ));
  }
}



