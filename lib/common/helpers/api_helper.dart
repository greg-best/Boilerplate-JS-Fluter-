class ApiHelper {

  static String getErrorMessageFromEndpoint(dynamic dynamicErrorMessage, String? httpErrorMessage, int statusCode) {
    if (dynamicErrorMessage is Map && dynamicErrorMessage.containsKey('meta') && dynamicErrorMessage['meta'].isNotEmpty) {
      return '[$statusCode] ${dynamicErrorMessage['meta']['message']}';
    } else if (dynamicErrorMessage is Map && dynamicErrorMessage.containsKey('reason') && dynamicErrorMessage['reason'].isNotEmpty) {
      return '[$statusCode] ${dynamicErrorMessage['reason']}';
    } else if (dynamicErrorMessage is Map && dynamicErrorMessage.containsKey('message') && dynamicErrorMessage['message'].isNotEmpty) {
      return '[$statusCode] ${dynamicErrorMessage['message']}';
    } else if (dynamicErrorMessage is String) {
      return '[$statusCode] $httpErrorMessage';
    } else {
      return '[$statusCode] $httpErrorMessage';
    }
  }
}
