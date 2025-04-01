import 'package:cash_flow/features/onboarding/presentation/widgets/custom_onboarding_body.dart';
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
              SizedBox(height: 200),
              CustomOnboardingBody(
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
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
