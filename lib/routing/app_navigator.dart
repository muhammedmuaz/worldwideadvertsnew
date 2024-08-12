import 'package:flutter/material.dart';

class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushReplacementTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void removeAllRoutes(String routeName) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  static goBack() {
    return navigatorKey.currentState!.pop();
  }
}