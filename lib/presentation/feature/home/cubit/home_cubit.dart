import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:gts_learn/app/tflite/tflite_manager.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

const bufferSize = 30;

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(this._tfLiteManager) : super(const HomeState.initial());

  final TFLiteManager _tfLiteManager;

  @override
  Future<void> init() async {
    final cameras = await availableCameras();
    emit(HomeState.success(camera: cameras[1]));
  }

  Future<void> handleCameraStream(CameraImage image) async {
    state.maybeMap(
      success: (state) {
        if (state.cameraBuffer.length < bufferSize) {
          emit(state.copyWith(cameraBuffer: [...state.cameraBuffer, image]));
          log('loading buffer ${state.cameraBuffer.length}/$bufferSize');
        } else {
          emit(
            state
                .copyWith(cameraBuffer: [...state.cameraBuffer.skip(0), image]),
          );
          log('buffer loaded');
        }
      },
      orElse: () => null,
    );
  }
}
