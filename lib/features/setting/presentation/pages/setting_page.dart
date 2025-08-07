import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          backgroundColor: AppColor.background,
        ),
        body: Container(
          color: AppColor.background,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.profile),
              Container(
                color: AppColor.white,
                child: Column(
                  children: [
                    
                    ListTile(
                        title: Text(AppStrings.profileSetting), onTap: () {}),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Notifications"),
                onTap: () {
                  // Navigate to notification settings
                },
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
