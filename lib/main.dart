import 'package:bus_sit_layout/config/di/dependency_injector.dart';
import 'package:bus_sit_layout/config/navigation/app_route.dart';
import 'package:bus_sit_layout/config/navigation/navigation_observer.dart';
import 'package:bus_sit_layout/config/navigation/route_name.dart';
import 'package:bus_sit_layout/config/di/state_management_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final AppRouter router = AppRouter();
  final routeObserver = CustomNavigationObserver();
  runApp(
    MultiProvider(
      providers: StateManagementProviders.providers,
      child:  BusLayoutApp(router: router, routeObserver: routeObserver),
    ),
  );
}

class BusLayoutApp extends StatefulWidget {
  final AppRouter router;
  final CustomNavigationObserver routeObserver;

  const BusLayoutApp({
    super.key,
    required this.router,
    required this.routeObserver,
  });

  @override
  State<BusLayoutApp> createState() => _BusLayoutAppState();
}

class _BusLayoutAppState extends State<BusLayoutApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => child!,
      child: MaterialApp(
        title: 'Bus Layout',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [CustomNavigationObserver()],
        themeMode: ThemeMode.system,
        navigatorKey: AppRouter.navigatorKey,
        onGenerateRoute: widget.router.generateRoute,
        initialRoute: RouteName.splash,
      ),
    );
  }
}