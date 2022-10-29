import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'process_video_cubit.freezed.dart';
part 'process_video_state.dart';

@injectable
class ProcessVideoCubit extends Cubit<ProcessVideoState> {
  ProcessVideoCubit() : super(const ProcessVideoState.initial());

  Future<void> init(List<CameraImage> cameraBuffer) async {
    emit(const ProcessVideoState.loading());
    await _processVideo(cameraBuffer);
    emit(const ProcessVideoState.success());
  }

  Future<void> _processVideo(List<CameraImage> cameraBuffer) async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
