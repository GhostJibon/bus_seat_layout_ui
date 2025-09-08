class RouteName {
  static RouteName? _instance;
  // Avoid self instance
  RouteName._();
  static RouteName get instance => _instance ??= RouteName._();

  static Future<String> get initialRoute async {
    return splash;
  }

  static const String splash = '/';
  static const String home = "/home";
  
}
