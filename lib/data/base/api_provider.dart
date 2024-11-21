
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/api_constant/api_constant.dart';
import 'app_interceptors.dart';

class NetworkProvider extends APIConstance {
  NetworkProvider();

  Dio createDio(String baseUrl) {
    return Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 120),
      baseUrl: baseUrl,
    ));
  }

  Dio addInterceptors(Dio dio, {List<String>? exceptionURL}) {
    if (kDebugMode) {
      return dio
        ..interceptors.add(AppInterceptors(this, dio))
        ..interceptors.add(PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          compact: false,
        ));
    } else {
      return dio..interceptors.add(AppInterceptors(this, dio));
    }
  }
}
