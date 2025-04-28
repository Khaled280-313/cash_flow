import 'package:cash_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final kaushan400Style64 = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    fontFamily: 'Pacifico',
  );
  static final montserrat500Style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    fontFamily: 'Montserrat',
  );
  static final montserrat300Style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColor.textSecondary,
    fontFamily: 'Montserrat',
  );
  static final montserrat500Style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
    fontFamily: 'Montserrat',
  );
  static final montserratBoldStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    fontFamily: 'Montserrat',
  );

  static final montserratBoldStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
    fontFamily: 'Montserrat',
  );
}
