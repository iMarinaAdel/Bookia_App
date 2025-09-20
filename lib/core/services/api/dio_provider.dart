import 'dart:async';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
  }

  static Future<Response> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: header),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: header),
    );
  }

  static Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: header),
    );
  }

  static Future<Response> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: header),
    );
  }
}
