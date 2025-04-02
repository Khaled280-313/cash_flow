import 'package:cash_flow/core/utils/assets.dart';
import 'package:cash_flow/core/utils/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: Assets.imagesImag1,
    title: AppStrings.onBoardingTitle1,
    description: AppStrings.onBoardingSubTitle1,
  ),
  OnBoardingModel(
    image: Assets.imagesImag2,
    title: AppStrings.onBoardingTitle2,
    description: AppStrings.onBoardingSubTitle2,
  ),
  OnBoardingModel(
    image: Assets.imagesImag3,
    title: AppStrings.onBoardingTitle3,
    description: AppStrings.onBoardingSubTitle3,
  ),
];
