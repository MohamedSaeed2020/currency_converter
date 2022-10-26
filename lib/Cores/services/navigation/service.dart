import 'package:calculator_converter/Cores/services/navigation/routes.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  const NavigationService();

  void openHomePage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.home)
          : Navigator.pushNamed(context, NavigationRoutes.home);

  void back(BuildContext context, {dynamic result}) =>
      Navigator.pop(context, result);
}
