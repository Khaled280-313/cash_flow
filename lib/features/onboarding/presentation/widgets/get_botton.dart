import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
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
          SizedBox(height: 40),
          CustomBotton(
            height: 50,
            onPressed: () {
              customNavigatPushReplacement(context: context, path: "/SignUp");
            },
            child: const Text(
              StringsApp.createAccount,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              customNavigatPushReplacement(context: context, path: "/SignIn");
            },
            child: Text(
              StringsApp.youHaveAccount,
              style: TextStyle(color: const Color.fromARGB(255, 56, 56, 56)),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 50),
          CustomBotton(
            height: 50,
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubicEmphasized);
            },
            child: const Text(
              StringsApp.next,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }
  }
}
