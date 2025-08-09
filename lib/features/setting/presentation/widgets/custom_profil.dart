import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

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