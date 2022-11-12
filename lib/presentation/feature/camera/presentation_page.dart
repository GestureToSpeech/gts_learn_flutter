import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/app/hooks/camera_hook.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/camera/cubit/camera_cubit.dart';
import 'package:gts_learn/presentation/feature/camera/widget/countdown.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key, required this.wordId});

  final int wordId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CameraCubit>(
        create: (_) => getIt<CameraCubit>()..init(),
        child: _CameraPageCore(wordId),
      ),
    );
  }
}

class _CameraPageCore extends StatelessWidget {
  const _CameraPageCore(this.wordId);

  final int wordId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) => state.whenOrNull(
        failure: () => _onFailure(context),
        collected: (imageBuffer, video) => _onCollected(
          context,
          imageBuffer,
          video,
          wordId,
        ),
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: (camera, _) => _CameraPageBody(camera),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Future<void> _onCollected(
    BuildContext context,
    List<CameraImage>? buffer,
    XFile? video,
    int wordId,
  ) async {
    //@TODO: REMOVE AND FIX IN A PROPER WAY
    await Future<void>.delayed(const Duration(milliseconds: 100));
    await context.router.replace(
      ProcessVideoRoute(cameraBuffer: buffer, video: video, wordId: wordId),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _CameraPageBody extends HookWidget {
  const _CameraPageBody(this.camera);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    final _cameraController = useCameraController(
      camera: camera,
      resolution: ResolutionPreset.medium,
      format: ImageFormatGroup.yuv420,
    );

    if (_cameraController!.value.isInitialized) {
      return Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
              child: CameraPreview(_cameraController),
            ),
          ),
          Center(
            child: Countdown(
              onFinished: () async {
                await _startRecording(context, _cameraController)
                    .then((value) => _onRecordingFinished(context, value));
              },
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<XFile> _startRecording(
    BuildContext context,
    CameraController controller,
  ) async {
    await controller.prepareForVideoRecording();
    await controller.startVideoRecording();
    await Future<void>.delayed(const Duration(seconds: 2, milliseconds: 600));
    final file = await controller.stopVideoRecording();
    return file;
  }

  Future<void> _onRecordingFinished(BuildContext context, XFile file) async =>
      context.read<CameraCubit>().onRecordingFinished(file);
}
