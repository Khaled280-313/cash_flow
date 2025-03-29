import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/assets.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:flutter/material.dart';

class CustomOnboardingBody extends StatelessWidget {
  final PageController pageController;
  const CustomOnboardingBody({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.imagesImag1),
                        fit: BoxFit.fill)),
              ),
              SizedBox(height: 24),
              Text(
                StringsApp.onBoardingTitle1,
                textAlign: TextAlign.center,
                style: AppTextStyle.montserrat500Style24,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                StringsApp.onBoardingSubTitle1,
                textAlign: TextAlign.center,
                style: AppTextStyle.montserrat300Style16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
