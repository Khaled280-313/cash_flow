import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class SliverAppBarHome extends StatelessWidget {
  const SliverAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(203, 235, 243, 246),
      expandedHeight: 100.0,
      leadingWidth: 100,
      leading: Text(
        AppStrings.home,
        style: AppTextStyle.montserrat500Style16.copyWith(
          fontSize: 30,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: Icon(
            Icons.cloud_off_outlined,
            color: AppColor.black,
          ),
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {
            customNavigatPush(context: context, path: "/SettingPage");
          },
          icon: Icon(
            Icons.settings,
            color: AppColor.black,
          ),
        )
      ],
    );
  }
}
