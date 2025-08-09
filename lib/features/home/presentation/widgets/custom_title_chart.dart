import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import 'custom_button_bottom_sheet.dart';

class CustomTitleChart extends StatelessWidget {
  const CustomTitleChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Text(S.of(context).totalBalance,
            style: AppTextStyle.montserratBoldStyle20),
      ),
      CustomButtonBottomSheet()
    ]);
  }
}
