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
      backgroundColor: AppColor.background,
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
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: AppColor.black,
          ),
        )
      ],
    );
  }
}