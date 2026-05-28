import 'package:flutter/material.dart';

class Responsive {

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double responsiveFont(
      BuildContext context, {
        required double desktop,
        double? tablet,
        double? mobile,
      }) {

    if (isMobile(context)) {
      return mobile ?? desktop * .55;
    }

    if (isTablet(context)) {
      return tablet ?? desktop * .75;
    }

    return desktop;
  }
}