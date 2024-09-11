class BaseUrlConfig {
  // Header
  static const requiredToken = 'requiredToken';
  static const xtoggleJobAlert = 'xtoggleJobAlert';

  static const language = 'language';
  static const requiredDeviceIdHeader = 'requiredDeviceIdHeader';
  static const requiredSource = 'requireSource';

  // Body
  static const requiredUserID = 'requiredUserId';
  static const requiredNoEncUserID = 'requiredNoEncUserID';
  static const requireLocation = 'requiredLocation';
  static const requireNotifToken = 'requireNotifToken';
  static const requireDeviceId = 'requiredDeviceId';
  static const requireNotifTokenMobile = 'requireNotifTokenMobile';
  static const toFormData = 'toFormData';
  static const download = 'download';

  // Others
  static const mixPanelEvent = 'mixPanelEvent';

  // // Production
  // static String? baseUrlApiEndpoint = const String.fromEnvironment('BASE_URL');
  // static String? baseUrlRootEndpoint = const String.fromEnvironment('BASE_URL');

  // static String? getBaseUrlApiEndpoint(Flavor flavor) {
  //   if (flavor == Flavor.development) {
  //     return const String.fromEnvironment('BASE_URL_DEV');
  //   } else {
  //     return const String.fromEnvironment('BASE_URL');
  //   }
  // }
}
