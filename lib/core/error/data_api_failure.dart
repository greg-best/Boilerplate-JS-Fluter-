import 'package:equatable/equatable.dart';

class DataApiFailure extends Equatable {
  final int? statusCode;
  final String? message;
  final String? httpMessage;
  final Map<String, dynamic>? errorData;

  const DataApiFailure({
    this.statusCode,
    this.message,
    this.httpMessage,
    this.errorData,
  });

  @override
  List<Object?> get props => [
        statusCode,
        message,
        httpMessage,
        errorData,
      ];

  @override
  String toString() {
    return "DataApiFailure(statusCode: $statusCode, message: $message, httpMessage: $httpMessage, errorData: $errorData)";
  }
}
