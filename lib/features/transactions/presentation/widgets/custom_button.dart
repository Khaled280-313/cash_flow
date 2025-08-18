import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed ;
  const CustomButton({
    super.key, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: 343,
      height: 56,
      child: Text(
        S.of(context).addTransaction,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColor.white),
      ),
    );
  }
}