import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_onboarding_body.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_page_indicator.dart';
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
              Align(
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
              ),
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
              _current == onBoardingList.length - 1
                  ? Column(
                      children: [
                        SizedBox(height: 40),
                        CustomBotton(
                          height: 50,
                          onPressed: () {
                            customNavigatPushReplacement(
                                context: context, path: "/SignUp");
                          },
                          child: const Text(
                            StringsApp.createAccount,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            customNavigatPushReplacement(
                                context: context, path: "/SignIn");
                          },
                          child: Text(
                            StringsApp.youHaveAccount,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 56, 56, 56)),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: 50),
                        CustomBotton(
                          height: 50,
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubicEmphasized);
                          },
                          child: const Text(
                            StringsApp.next,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
