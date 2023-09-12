import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/di/di.dart';
import 'core/notification/local_notification.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/navigation_service.dart';
import 'features/home_screen/bloc/home_bloc.dart';
import 'features/splash_screen/presentation/bloc/splash_bloc.dart';

Future<void> main() async {
  await diInit();
  await LocalNotification.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di<SplashBloc>()),
          BlocProvider(create: (_) => di<HomeBloc>()),
        ],
        child: MaterialApp(
          title: 'Handover Delivery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: di<NavigationService>().navigatorKey,
          onGenerateRoute: (settings) => AppRoutes.appRoutes(settings),
        ),
      );
    });
  }
}
