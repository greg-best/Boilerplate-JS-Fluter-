import 'package:boilerplate/common/helpers/api_helper.dart';
import 'package:boilerplate/common/models/auth/login_response.dart';
import 'package:boilerplate/core/error/data_api_failure.dart';
import 'package:boilerplate/core/error/failure.dart';
import 'package:boilerplate/core/service/network_info.dart';
import 'package:boilerplate/module/home/data/datasource/home_datasource_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class HomeRepository {
  final HomeRemoteDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, LoginResponse>> loginEmailSocmed(String email) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final LoginResponse response = await remoteDataSource.loginEmailSocmed(email);
        return Right(response);
      } on DioException catch (error) {
        if (error.response == null) {
          return Left(
            ServerFailure(
              DataApiFailure(message: error.message),
            ),
          );
        }
        final errorResponseData = error.response?.data;
        dynamic errorData;
        String errorMessage = ApiHelper.getErrorMessageFromEndpoint(
          errorResponseData,
          error.message ?? 'Http error message is Empty',
          error.response?.statusCode ?? 400,
        );
        if (errorResponseData is Map && errorResponseData.containsKey('errors')) {
          errorData = errorResponseData['errors'];
        }
        return Left(
          ServerFailure(
            DataApiFailure(
              message: errorMessage,
              statusCode: error.response?.statusCode,
              httpMessage: error.message,
              errorData: errorData,
            ),
          ),
        );
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}

class ParamsLoginSocmed extends Equatable {
  final String? email;

  const ParamsLoginSocmed({
    this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];

  @override
  String toString() {
    return 'ParamsLoginSocmed{email: $email}';
  }
}
