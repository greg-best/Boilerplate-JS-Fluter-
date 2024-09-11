enum Flavor {
  development,
  production,
}

class UrlConstant {
  static Flavor flavor = Flavor.development;

  static bool get isDevelopment => flavor == Flavor.development;

  static String get baseUrl {
    switch (flavor) {
      case Flavor.development:
        return '';
      case Flavor.production:
        return '';
      default:
        return '';
    }
  }
}