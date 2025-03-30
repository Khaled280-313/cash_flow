import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:flutter/material.dart';
import '../../data/model/on_boarding_model.dart';

class CustomTextOnBoarding extends StatelessWidget {
  const CustomTextOnBoarding({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          _pageController.jumpToPage(onBoardingList.length - 1);
        },
        child: Text(
          StringsApp.skip,
          style: TextStyle(color: ColorsApp.primary, fontSize: 16),
        ),
      ),
    );
  }
}
