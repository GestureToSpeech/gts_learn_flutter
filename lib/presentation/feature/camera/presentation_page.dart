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
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CameraCubit>(
        create: (_) => getIt<CameraCubit>()..init(),
        child: const _CameraPageCore(),
      ),
    );
  }
}

class _CameraPageCore extends StatelessWidget {
  const _CameraPageCore();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) => state.whenOrNull(
        failure: () => _onFailure(context),
        collected: (buffer) => _onCollected(context, buffer),
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
    List<CameraImage> buffer,
  ) async {
    //@TODO: REMOVE AND FIX IN A PROPER WAY
    await Future<void>.delayed(const Duration(milliseconds: 100));
    await context.router.replace(ProcessVideoRoute(cameraBuffer: buffer));
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
              onFinished: () => _cameraController.startImageStream(
                (image) => _onImageReceived(context, image),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void _onImageReceived(BuildContext context, CameraImage image) {
    context.read<CameraCubit>().handleCameraStream(image);
  }
}
