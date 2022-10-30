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

  Future<void> init(List<CameraImage>? cameraBuffer, XFile? video) async {
    emit(const ProcessVideoState.loading());
    if (cameraBuffer != null) await _processImageBuffer(cameraBuffer);
    if (video != null) await _processVideoFile(video);
    emit(const ProcessVideoState.success());
  }

  Future<void> _processImageBuffer(List<CameraImage> cameraBuffer) async {
    await Future<void>.delayed(const Duration(seconds: 5));
  }

  Future<void> _processVideoFile(XFile video) async {
    final result = await _sendVideoUseCase(video.path);
  }
}
