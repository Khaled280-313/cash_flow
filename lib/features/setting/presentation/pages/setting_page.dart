import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(AppStrings.profile),
                      onTap: () {},
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text(AppStrings.profileSetting),
                      onTap: () {},
                      leading: Icon(Icons.settings),
                    ),
                    ListTile(
                      title: Text(AppStrings.editAccount),
                      onTap: () {},
                      leading: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.all(20)),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [],
                ),
              ),
              ListTile(
                title: const Text("Privacy"),
                onTap: () {
                  // Navigate to privacy settings
                },
              ),
            ],
          ),
        ));
  }
}
