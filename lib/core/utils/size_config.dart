import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeigth;
  static double? defaultSize;
  static Orientation? orientation;
  void init(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.width;
    screenHeigth = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeigth! * .024
        : screenWidth! * .024;
  }
}
