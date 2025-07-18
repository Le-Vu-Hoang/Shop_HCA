import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'authorizationInterception.dart';
import 'interceptor.dart';

class DioClient {
  Dio get dio => _dio;

  late final Dio _dio;
  DioClient(): _dio = Dio(
    BaseOptions(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        baseUrl: dotenv.env["BASE_URL"] ?? (throw Exception("BASE_URL not set in .env")),
        responseType: ResponseType.json,
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30)
    ),
  )..interceptors.addAll([
    LoggerInterceptor(),
    AuthorizationInterception()
  ]);

  // GET METHOD
  Future < Response > get(
      String url, {
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }
    on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future < Response > post(
      String url, {
        data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        ProgressCallback ? onSendProgress,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future < Response > put(
      String url, {
        dynamic data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
        ProgressCallback ? onSendProgress,
        ProgressCallback ? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future < dynamic > delete(
      String url, {
        data,
        Map < String,
            dynamic > ? queryParameters,
        Options ? options,
        CancelToken ? cancelToken,
      }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}