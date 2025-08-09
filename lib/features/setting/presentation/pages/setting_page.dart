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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Material(
            child: ListTile(
                tileColor: AppColor.white,
                title: Text(AppStrings.theme),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColor.white,
                          title: Text(AppStrings.theme),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                ListTile(
                                  title: Text("System Default"),
                                  onTap: () {
                                    // Change theme to System Default
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  title: Text("Light"),
                                  onTap: () {
                                    // Change theme to Light
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  title: Text("Dark"),
                                  onTap: () {
                                    // Change theme to Dark
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                leading: Icon(Icons.brightness_6)),
          ),
          Material(
            child: ListTile(
                tileColor: AppColor.white,
                title: Text(AppStrings.language),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColor.white,
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
          ),
          Material(
            child: ListTile(
                tileColor: AppColor.white,
                title: Text(AppStrings.currency),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColor.white,
                        title: Text(AppStrings.currency),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              ListTile(
                                title: Text("USD"),
                                onTap: () {
                                  // Change currency to USD
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text("EUR"),
                                onTap: () {
                                  // Change currency to EUR
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
                leading: Icon(Icons.attach_money)),
          )
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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          Material(
            child: ListTile(
              tileColor: AppColor.white,
              title: Text(AppStrings.profile),
              onTap: () {},
              leading: Icon(Icons.person),
            ),
          ),
          Material(
            child: ListTile(
              tileColor: AppColor.white,
              title: Text(AppStrings.profileSetting),
              onTap: () {},
              leading: Icon(Icons.settings),
            ),
          ),
          Material(
            child: ListTile(
              tileColor: AppColor.white,
              title: Text(AppStrings.editAccount),
              onTap: () {},
              leading: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
