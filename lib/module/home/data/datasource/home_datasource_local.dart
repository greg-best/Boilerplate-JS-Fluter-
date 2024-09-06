

import 'package:dio/dio.dart';


abstract class HomeRemoteDataSource {

  //example: 
  // Future<Map<String,dynamic>> getCompany();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  HomeRemoteDataSourceImpl({
    required this.dio,
  });


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
