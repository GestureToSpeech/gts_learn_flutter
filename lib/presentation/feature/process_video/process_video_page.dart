import 'package:avatar_glow/avatar_glow.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/process_video/cubit/process_video_cubit.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';

class ProcessVideoPage extends StatelessWidget {
  const ProcessVideoPage({super.key, required this.cameraBuffer});

  final List<CameraImage> cameraBuffer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<ProcessVideoCubit>()..init(cameraBuffer),
        lazy: false,
        child: const _ProcessVideoPageCore(),
      ),
    );
  }
}

class _ProcessVideoPageCore extends StatelessWidget {
  const _ProcessVideoPageCore();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessVideoCubit, ProcessVideoState>(
      listener: (context, state) => state.whenOrNull(
        failure: () => _onFailure(context),
        success: () => _onSuccess(context),
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const _ProcessVideoPageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}

  void _onSuccess(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _ProcessVideoPageBody extends StatelessWidget {
  const _ProcessVideoPageBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: _LogoInCircles()),
        AppSpacers.h16,
        Text(context.str.process_video__processing),
      ],
    );
  }
}

class _LogoInCircles extends StatelessWidget {
  const _LogoInCircles();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AvatarGlow(
          glowColor: AppColors.mainGreen,
          endRadius: AppDimens.processVideoCircleSize,
          child: Container(
            width: AppDimens.processVideoCircleSize,
            height: AppDimens.processVideoCircleSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainGreen,
            ),
          ),
        ),
        const Image(
          width: AppDimens.processVideoLogoSize,
          height: AppDimens.processVideoLogoSize,
          image: AssetImage(AppAssets.logoHand),
          color: AppColors.white,
        ),
      ],
    );
  }
}
