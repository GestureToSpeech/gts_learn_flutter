part of 'camera_cubit.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.initial() = _Initial;
  const factory CameraState.loading() = _Loading;
  const factory CameraState.success({
    required CameraDescription camera,
    @Default([]) List<CameraImage> cameraBuffer,
  }) = _Success;
  const factory CameraState.failure() = _Failure;
}
