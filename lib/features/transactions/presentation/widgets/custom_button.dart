import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: 343,
      height: 56,
      child: Text(
        AppStrings.addTransaction,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColor.white),
      ),
    );
  }
}