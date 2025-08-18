import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/features/onboarding/data/model/on_boarding_model.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOnboardingBody extends StatelessWidget {
  final PageController pageController;
  final Function(int)? onPageChanged;
  const CustomOnboardingBody(
      {super.key, required this.pageController, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: pageController,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: SvgPicture.asset(
                  onBoardingList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50),
              CustomPageIndicator(
                pageController: pageController,
              ),
              SizedBox(height: 10),
              Text(
                onBoardingList[index].title,
                textAlign: TextAlign.center,
                style: AppTextStyle.montserrat500Style24,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                onBoardingList[index].description,
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
