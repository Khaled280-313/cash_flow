import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_onboarding_body.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_page_indicator.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_text_on_boarding.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/get_botton.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _current = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 20),
              CustomTextOnBoarding(pageController: _pageController),
              SizedBox(height: 150),
              CustomOnboardingBody(
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                pageController: _pageController,
              ),
              CustomPageIndicator(
                pageController: _pageController,
              ),
              GetBotton(
                current: _current,
                pageController: _pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
