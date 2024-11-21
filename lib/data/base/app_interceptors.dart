import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/api_constant/api_constant.dart';
import '../local/base_local.dart';
import '../local/store_data/store.box.dart';
import '../local/store_data/system.dart';
import 'api_exception.dart';
import 'api_provider.dart';

class AppInterceptors extends Interceptor {
  final _local = BaseLocalRepository();
  final NetworkProvider network;
  final Dio dio;

  AppInterceptors(this.network, this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String url = options.uri.toString().replaceAll(options.baseUrl, '');
      options.baseUrl = network.pathMapping(url);

      var data = options.data;
      var user = Hive.box<StoreSystemData>(systemBox).getAt(0);
      var token = user?.accessToken;
      var ignoreHeader = false;
      try {
        ignoreHeader = (data is! FormData ? (data['ignoreHeader'] ?? '0') : '0') == '1';
      } catch (e) {

      }

      var companyID = user?.companyID;
      if (companyID == null && (options.uri.toString().contains("image/background"))) {
        return handler.next(options);
      }

      var r = await PackageInfo.fromPlatform();
      String packageName = r.packageName;
      var deviceID = await _local.getUniqueID();
      options.headers.addAll(
        {
          "appName": r.appName,
          "packagename": packageName,
          "version": r.version,
          "buildNumber": r.buildNumber,
          "deviceID": "$deviceID",
          "companyid": ignoreHeader ? '' : companyID ?? '',
        },
      );
      if (token != null) {
        options.headers.update(
          "Authorization",
              (value) => "Bearer $token",
          ifAbsent: () => "Bearer $token",
        );
      }
      if (options.method == "GET") {
        options.queryParameters = (options.queryParameters);
      }
      if (data is FormData) {
        data.fields.addAll({});
      } else {
        data ??= <String, dynamic>{};
      }
      options.data = data;
    } catch (e) {}
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (APIConstance.ignoreRefreshToken('${err.requestOptions.uri}')) {
        APIException exception = APIException(
          requestOptions: err.requestOptions,
          error: err.error,
          response: err.response,
          type: err.type,
        );
        return handler.next(exception);
      } else {
        Hive.box<StoreSystemData>(systemBox).getAt(0);
        if ((err.response!.statusCode == 401 || err.response!.statusCode == 403) && err.requestOptions.headers['Authorization'] != null) {

        }
        APIException exception = APIException(
          requestOptions: err.requestOptions,
          error: err.error,
          response: err.response,
          type: err.type,
        );
        return handler.next(exception);
      }
    } catch (e) {
      return handler.next(err);
    }
  }


  Future<Response<dynamic>> retry(RequestOptions requestOptions, {required String token}) {
    requestOptions.headers.update(
      "Authorization",
          (value) => "Bearer $token",
      ifAbsent: () => "Bearer $token",
    );
    return dio.fetch(requestOptions);
  }
}
