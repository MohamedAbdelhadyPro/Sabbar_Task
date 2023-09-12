import 'package:flutter/material.dart';

class NavigationService {
  bool currentlyInLoginPage = false;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
    // navigatorKey.currentState.pushNamedAndRemoveUntil(newRouteName, (route) => AppRoutes.initialize)
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
    // navigatorKey.currentState.pushNamedAndRemoveUntil(newRouteName, (route) => AppRoutes.initialize)
  }
}
