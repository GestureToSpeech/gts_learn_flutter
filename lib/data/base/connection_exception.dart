import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection_exception.freezed.dart';

@freezed
class ConnectionException with _$ConnectionException {
  const factory ConnectionException({required Exception exception}) =
      _ConnectionException;
  const factory ConnectionException.network({
    required NetworkExceptionReason reason,
    required Exception exception,
  }) = _Network;

  const factory ConnectionException.response({
    required NetworkExceptionReason reason,
    required Exception exception,
    required dynamic data,
    required int? statusCode,
  }) = _Response;
}

enum NetworkExceptionReason {
  responseError,
  timeout,
  connectionLost,
  cancelled
}
