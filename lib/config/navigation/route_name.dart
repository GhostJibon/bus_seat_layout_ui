import 'package:bus_sit_layout/config/navigation/app_route.dart';
import 'package:bus_sit_layout/features/splash/presentaion/pages/splash_screen.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case RouteName.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
