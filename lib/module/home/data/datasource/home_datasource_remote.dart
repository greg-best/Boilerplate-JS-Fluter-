import 'package:boilerplate/common/models/auth/login_response.dart';
import 'package:boilerplate/config/url_config.dart';
import 'package:boilerplate/core/constants/url_constant.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<LoginResponse> loginEmailSocmed(String email);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({
    required this.dio,
  });

  final baseUrl = UrlConstant.baseUrl;

  @override
  Future<LoginResponse> loginEmailSocmed(String email) async {
    final String path = '$baseUrl/example';
    final Response<dynamic> response = await dio.post(
      path,
      options: Options(
        contentType: Headers.jsonContentType,
        extra: {
          BaseUrlConfig.requireLocation: true,
          BaseUrlConfig.requireNotifToken: true,
          BaseUrlConfig.requireDeviceId: true,
        },
      ),
      data: <String, dynamic>{
        'email': email,
      },
    );
    if (response.statusCode.toString().startsWith('2')) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: RequestOptions(path: path),
      );
    }
  }
}
