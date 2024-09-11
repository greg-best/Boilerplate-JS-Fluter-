

import 'package:boilerplate/core/constants/url_constant.dart';
import 'package:dio/dio.dart';


abstract class LoginRemoteDataSource {

  //example:
  // Future<Map<String,dynamic>> getCompany();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;
  LoginRemoteDataSourceImpl({
    required this.dio,
  });

  Future<List<Map<String,dynamic>>> getTests() async {
    final String path = UrlConstant.baseUrl;
    final Response<dynamic> response = await dio.get(path, options: Options());
    if (response.statusCode.toString().startsWith('2')) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: RequestOptions(path: path),
      );
    }
  }


  /// example repository

  // final baseUrl = FlavorConfig.instance!.values!.baseUrlEndpoint;
  // @override
  // Future<Map<String,dynamic>> {isinamafunction}() async {
  //   final String path = '$baseUrl/v1/company';
  //   final Map<String,dynamic> response = await dio.get(path,
  //       options: Options(headers: {
  //         BaseUrlConfig.requiredToken: true,
  //       }));
  //   if (response.statusCode == 200) {
  //     // return CompanyResponse.fromJson(response.data);
  //     return response.data;
  //   } else {
  //     throw DioError(
  //       requestOptions: RequestOptions(path: path),
  //     );
  //   }
  // }
}
