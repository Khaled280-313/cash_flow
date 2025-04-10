import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  final PageController pageController;
  const CustomPageIndicator({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: WormEffect(
          activeDotColor: AppColor.primary,
          dotHeight: 8,
          dotWidth: 8,
        ),
      ),
    );
  }
}
