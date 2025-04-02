import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:flutter/material.dart';

class CustombottonSkip extends StatelessWidget {
  const CustombottonSkip({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.primary,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // customNavigatPushReplacement(context: context, path: "/SignUp");
        pageController.jumpToPage(onBoardingList.length - 1);
      },
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            AppStrings.skip,
            style: TextStyle(color: AppColor.primary),
          ),
        ),
      ),
    );
  }
}
