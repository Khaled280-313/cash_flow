import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CustomSettingApp extends StatefulWidget {
  const CustomSettingApp({
    super.key,
  });

  @override
  State<CustomSettingApp> createState() => _CustomSettingAppState();
}

class _CustomSettingAppState extends State<CustomSettingApp> {
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
