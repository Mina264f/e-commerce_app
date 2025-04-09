import 'package:dio/dio.dart';

import 'end_points.dart';

class ApiHelper {
  static Dio? dio;

  static setupDio() {
    const Duration timeout = Duration(seconds: 30);
    dio = Dio();
    dio!
      ..options.baseUrl = EndPoints.baseUrl
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.receiveDataWhenStatusError = true;
  }

  static void addDioHeaders() {
    dio!.options.headers = {'Content-Type': 'application/json'};
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!.get(url, queryParameters: queryParameters);
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(url, queryParameters: queryParameters, data: data);
  }
}
