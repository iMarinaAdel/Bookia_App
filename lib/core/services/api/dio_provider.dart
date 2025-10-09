import 'dart:async';

import 'package:bookia/core/routes/app_navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = {
            "Bearer ${LocalHelper.getToken()}"
          };
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            pushToBase(navKey.currentContext!, Routes.welcome);
            pushToBase(navKey.currentContext!, Routes.login);
          }
        },
      ),
    );

    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
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
