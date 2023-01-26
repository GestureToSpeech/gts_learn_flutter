import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<T> get<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool forceRefreshCache = false,
  });

  Future<T> post<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<T> put<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<T> head<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<T> delete<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}
