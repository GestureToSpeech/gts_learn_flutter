import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'camera_cubit.freezed.dart';
part 'camera_state.dart';

const bufferSize = 64;

@injectable
class CameraCubit extends BaseCubit<CameraState> {
  CameraCubit() : super(const CameraState.initial());

  @override
  Future<void> init() async {
    final cameras = await availableCameras();
    emit(CameraState.success(camera: cameras[1]));
  }

  Future<void> handleCameraStream(CameraImage image) async {
    state.maybeMap(
      success: (state) {
        if (state.cameraBuffer.length < bufferSize) {
          emit(state.copyWith(cameraBuffer: [...state.cameraBuffer, image]));
          log('loading buffer ${state.cameraBuffer.length}/$bufferSize');
        } else {
          final buffer = [...state.cameraBuffer.skip(0), image];
          emit(CameraState.collected(cameraBuffer: buffer));
          log('buffer loaded');
        }
      },
      orElse: () => null,
    );
  }

  Future<void> onRecordingFinished(XFile file) async =>
      emit(CameraState.collected(file: file));
}
