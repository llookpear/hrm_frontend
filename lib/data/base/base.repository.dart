

import 'package:dio/dio.dart';
import '../local/base_local.dart';
import 'api_provider.dart';

class BaseRepository extends NetworkProvider {
  late Dio dio;
  BaseLocalRepository local = BaseLocalRepository();

  BaseRepository({Dio? dio}) {
    this.dio = dio ??
        addInterceptors(
          createDio(pathMapping("")),
        );
  }
}
