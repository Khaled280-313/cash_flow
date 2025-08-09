
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
          // Navigate to privacy settings
        },
      ),
    );
  }
}
