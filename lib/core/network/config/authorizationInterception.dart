import 'package:dio/dio.dart';
import 'package:e_commercial/data/datasources/local/auth_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../injection/injection_container.dart';

class AuthorizationInterception extends Interceptor {
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    final token = await sl<AuthStorageService>().getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
