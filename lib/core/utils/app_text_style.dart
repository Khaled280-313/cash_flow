import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final kaushan400Style64 = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w400,
    color: ColorsApp.primary,
    fontFamily: 'Pacifico',
  );
  static final montserrat500Style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsApp.primary,
    fontFamily: 'Montserrat',
  );
  static final montserrat300Style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: const Color.fromARGB(255, 90, 89, 89),
    fontFamily: 'Montserrat',
  );
}
