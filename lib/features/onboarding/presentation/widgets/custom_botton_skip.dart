import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
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
      splashColor: ColorsApp.primary,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // customNavigatPushReplacement(context: context, path: "/SignUp");
        pageController.jumpToPage(onBoardingList.length - 1);
      },
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: ColorsApp.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            StringsApp.skip,
            style: TextStyle(color: ColorsApp.primary),
          ),
        ),
      ),
    );
  }
}
