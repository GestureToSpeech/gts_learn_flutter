import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/app/hooks/camera_hook.dart';
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
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: (camera, _) => _CameraPageBody(camera),
        orElse: () => const SizedBox(),
      ),
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
          // ElevatedButton(
          //   onPressed: () => _cameraController.startImageStream(
          //     (image) => context.read<CameraCubit>().handleCameraStream(image),
          //   ),
          //   child: const Text('Start image stream'),
          // ),
          Center(
              child: Countdown(
            onFinished: () {},
          )),
        ],
      );
    } else {
      return Container();
    }
  }
}
