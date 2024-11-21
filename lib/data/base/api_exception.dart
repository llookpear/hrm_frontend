import 'package:dio/dio.dart';

class APIException extends DioException {
  String get messageCustom {
    try {
      if (response == null) throw ("No Response");
      var data = response!.data ?? {};
      var _message = data["error"] ?? data["err"] ?? data["msg"] ?? data["message"] ?? data["MSG"] ?? data["ERRORMSG"] ?? message;
      return _message;
    } catch (e) {
      return "${e}";
    }
  }

  @override
  String toString() {
    return messageCustom;
  }

  APIException({
    required RequestOptions requestOptions,
    Response? response,
    DioExceptionType type = DioExceptionType.unknown,
    error,
  }) : super(
    requestOptions: requestOptions,
    type: type,
    response: response,
    error: error,
  );
}
