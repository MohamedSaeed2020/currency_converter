import 'package:calculator_converter/Common/home/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationRoutes {
  static const String home = '/home';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NavigationRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      throw 'Invalid route';
  }
}
