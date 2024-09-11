import '../core/constants/url_constant.dart';

enum Flavor {
  development,
  production,
}

class EnvConfig {
  static Flavor? flavor;

  static String get name => flavor?.name ?? '';

  static bool get isDevelopment => flavor == Flavor.development;
}
