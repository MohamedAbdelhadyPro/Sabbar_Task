import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handover/core/di/di.dart';
import 'package:handover/core/routes/navigation_service.dart';
import 'package:handover/features/home_screen/home_screen.dart';
import 'package:handover/features/splash_screen/presentation/bloc/splash_bloc.dart';

import '../../features/home_screen/bloc/home_bloc.dart';
import '../../features/splash_screen/presentation/splash_screen.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const splashScreenRoute = "/";
  static const homeScreenRoute = "/homeScreenRoute";

  static Route<dynamic> appRoutes(RouteSettings? settings) {
    switch (settings!.name!) {
      case splashScreenRoute:
        di<SplashBloc>().add(InitSplashEvent());
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });
      case homeScreenRoute:
        di<NavigationService>()
            .navigatorKey
            .currentContext!
            .read<HomeBloc>()
            .add(InitLocationEvent(
                myLocation: settings.arguments == null
                    ? null
                    : (settings.arguments as LatLng)));
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Container(),
    );
  }
}
