import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;
  static String? _accessToken;

  static void setAccessToken(String token) {
    _accessToken = token;
  }

  static void clearAccessToken() {
    _accessToken = null;
  }

  static Dio getDio() {
    if (_dio != null) return _dio!;

    const timeOut = Duration(seconds: 30);

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: {
          'Content-Type': 'application/json',
          'apikey': ApiConstants.supabaseAnonKey,
        },
      ),
    );

    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers["Authorization"] = "Bearer $_accessToken";
          }
          return handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return _dio!;
  }
}
