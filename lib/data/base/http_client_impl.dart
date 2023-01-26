import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:video_cutter/data/base/connection_exception.dart';
import 'package:video_cutter/data/base/http_client.dart';

typedef HttpLibraryMethod<T> = Future<Response<T>> Function();

@Singleton(as: HttpClient)
class HttpClientImpl implements HttpClient {
  HttpClientImpl();

  // TODO(Bartoro): make this url as a constant somewhere in our app.
  final _client = Dio(BaseOptions(baseUrl: '51.210.147.160/'));

  @override
  Future<T> get<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool forceRefreshCache = false,
  }) async {
    final response = await _mapException(
      () => _client.get<TJson>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
    return internalMapper(response.data as TJson);
  }

  @override
  Future<T> post<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _mapException(
      () => _client.post<TJson>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
    return internalMapper(response.data as TJson);
  }

  @override
  Future<T> put<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _mapException(
      () => _client.put<TJson>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
    return internalMapper(response.data as TJson);
  }

  @override
  Future<T> head<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _mapException(
      () => _client.head<TJson>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
    return internalMapper(response.data as TJson);
  }

  @override
  Future<T> delete<T, TJson>(
    String path,
    T Function(TJson json) internalMapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _mapException(
      () => _client.delete<TJson>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
    return internalMapper(response.data as TJson);
  }

  // Exception mapper to catch potential errors after every 'network interaction'.
  // It takes 'risky' function as argument tries executing it.
  Future<Response<T>> _mapException<T>(
      HttpLibraryMethod<T> request_func) async {
    try {
      return await request_func();
    } on DioError catch (exception) {
      switch (exception.type) {
        case DioErrorType.cancel:
          throw ConnectionException.network(
            reason: NetworkExceptionReason.cancelled,
            exception: exception,
          );
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          throw ConnectionException.network(
            reason: NetworkExceptionReason.timeout,
            exception: exception,
          );
        case DioErrorType.response:
          final response = exception.response;
          // Dio should guarantee response data, but I did this check just to be safe.
          if (response == null || response is! Response<T>) {
            throw ConnectionException.network(
              reason: NetworkExceptionReason.responseError,
              exception: exception,
            );
          }
          throw ConnectionException.response(
            reason: NetworkExceptionReason.responseError,
            exception: exception,
            statusCode: response.statusCode,
            data: response.data,
          );
        case DioErrorType.other:
        default:
          throw ConnectionException(exception: exception);
      }
    } catch (e) {
      throw ConnectionException(
        exception: e is Exception ? e : Exception('Unknown exception ocurred'),
      );
    }
  }
}
