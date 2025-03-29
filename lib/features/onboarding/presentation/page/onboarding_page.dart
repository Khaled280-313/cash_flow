import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_onboarding_body.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  StringsApp.skip,
                  style:
                      TextStyle(color: const Color.fromARGB(255, 56, 56, 56)),
                ),
              ),
              // SizedBox(height: SizeConfig.defaultSize! * 10),
              SizedBox(height: 150),
              CustomOnboardingBody(
                pageController: _pageController,
              ),
              CustomPageIndicator(
                pageController: _pageController,
              ),
              SizedBox(height: 70),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // CustomBotton(
                  //   height: 60,
                  //   child: Icon(
                  //     Icons.arrow_back,
                  //     color: ColorsApp.white,
                  //   ),
                  // ),
                  CustomBotton(
                    height: 60,
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorsApp.white,
                    ),
                  ),
                ],
              )
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
