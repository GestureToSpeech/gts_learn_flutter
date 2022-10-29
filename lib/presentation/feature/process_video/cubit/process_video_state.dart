part of 'process_video_cubit.dart';

@freezed
class ProcessVideoState with _$ProcessVideoState {
const factory ProcessVideoState.initial() = _Initial;
const factory ProcessVideoState.loading() = _Loading;
const factory ProcessVideoState.success() = _Success;
const factory ProcessVideoState.failure() = _Failure;
}
