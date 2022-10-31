import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/usecase/send_video_use_case.dart';
import 'package:injectable/injectable.dart';

part 'process_video_cubit.freezed.dart';
part 'process_video_state.dart';

@injectable
class ProcessVideoCubit extends Cubit<ProcessVideoState> {
  ProcessVideoCubit(this._sendVideoUseCase)
      : super(const ProcessVideoState.initial());

  final SendVideoUseCase _sendVideoUseCase;

  Future<void> init(
    List<CameraImage>? cameraBuffer,
    XFile? video,
    int wordId,
  ) async {
    emit(const ProcessVideoState.loading());
    if (cameraBuffer != null) await _processImageBuffer(cameraBuffer);
    if (video != null) {
      final accuracy = await _processVideoFile(video, wordId);
      emit(ProcessVideoState.success(accuracy: accuracy));
    }
  }

  Future<void> _processImageBuffer(List<CameraImage> cameraBuffer) async {
    await Future<void>.delayed(const Duration(seconds: 5));
  }

  Future<int> _processVideoFile(XFile video, int wordId) async {
    final result = await _sendVideoUseCase(video.path);
    print(result);
    return (result[wordId] * 100).round();
  }
}
