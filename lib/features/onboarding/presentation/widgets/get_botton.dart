import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/function/on_boarding_visited.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton_skip.dart';
import 'package:flutter/material.dart';

class GetBotton extends StatelessWidget {
  final PageController pageController;
  final int current;
  const GetBotton(
      {super.key, required this.current, required this.pageController});

  @override
  Widget build(BuildContext context) {
    if (current == onBoardingList.length - 1) {
      return Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: CustomBotton(
              color: AppColor.primary,
              height: 50,
              onPressed: () {
                isOnBoardingVisited();
                customNavigatPushReplacement(context: context, path: "/SignIn");
              },
              child: Text(
                AppStrings.signIn,
                style: AppTextStyle.montserrat300Style16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: CustomBotton(
              color: AppColor.white,
              height: 50,
              onPressed: () {
                isOnBoardingVisited();
                customNavigatPushReplacement(context: context, path: "/SignUp");
              },
              child: Text(
                AppStrings.createAccount,
                style: AppTextStyle.montserrat300Style16.copyWith(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustombottonSkip(pageController: pageController),
              CustomBotton(
                height: 50,
                color: AppColor.primary,
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubicEmphasized);
                },
                child: const Text(
                  AppStrings.next,
                  style: TextStyle(color: AppColor.white),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
