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
              CustomProfil(),
              Padding(padding: EdgeInsetsGeometry.all(7)),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(AppStrings.app),
              ),
              CustomSittingApp(),
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

class CustomSittingApp extends StatefulWidget {
  const CustomSittingApp({
    super.key,
  });

  @override
  State<CustomSittingApp> createState() => _CustomSittingAppState();
}

class _CustomSittingAppState extends State<CustomSittingApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
              title: Text(AppStrings.theme),
              onTap: () {},
              splashColor: AppColor.primary,
              selectedColor: AppColor.primary,
              leading: Icon(Icons.brightness_6)),
          ListTile(
              title: Text(AppStrings.language),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(AppStrings.language),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            ListTile(
                              title: Text("English"),
                              onTap: () {
                                // Change language to English
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              title: Text("Arabic"),
                              onTap: () {
                                // Change language to Arabic
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              leading: Icon(Icons.language)),
          ListTile(
              title: Text(AppStrings.currency),
              onTap: () {},
              leading: Icon(Icons.attach_money))
        ],
      ),
    );
  }
}

class CustomProfil extends StatelessWidget {
  const CustomProfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
