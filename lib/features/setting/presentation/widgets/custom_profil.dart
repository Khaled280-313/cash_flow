import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';

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
              title: Text(S.of(context).profile),
              onTap: () {
                customNavigatPush(context: context, path: "/ProfilePage");
              },
              leading: Icon(Icons.person),
            ),
          ),
          Material(
            child: ListTile(
              tileColor: AppColor.white,
              title: Text(S.of(context).profileSetting),
              onTap: () {},
              leading: Icon(Icons.settings),
            ),
          ),
          Material(
            child: ListTile(
              tileColor: AppColor.white,
              title: Text(S.of(context).editAccount),
              onTap: () {},
              leading: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
