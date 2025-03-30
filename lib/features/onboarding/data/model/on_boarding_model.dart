import 'package:cash_flow/core/utils/assets.dart';
import 'package:cash_flow/core/utils/string_app.dart';

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
    title: StringsApp.onBoardingTitle1,
    description: StringsApp.onBoardingSubTitle1,
  ),
  OnBoardingModel(
    image: Assets.imagesImag2,
    title: StringsApp.onBoardingTitle2,
    description: StringsApp.onBoardingSubTitle2,
  ),
  OnBoardingModel(
    image: Assets.imagesImag3,
    title: StringsApp.onBoardingTitle3,
    description: StringsApp.onBoardingSubTitle3,
  ),
];
