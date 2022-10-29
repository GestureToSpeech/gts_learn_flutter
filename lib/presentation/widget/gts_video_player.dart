import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:video_player/video_player.dart';

class GTSVideoPlayer extends StatefulWidget {
  const GTSVideoPlayer({super.key, required this.assetPath, this.cornerIcon});

  final String assetPath;
  final IconData? cornerIcon;

  @override
  State<GTSVideoPlayer> createState() => _GTSVideoPlayerState();
}

class _GTSVideoPlayerState extends State<GTSVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.assetPath,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        setState(() {});
      }
    });
    //check if asset path value has changed
    if (_controller.dataSource != widget.assetPath) {
      _changeVideoPath(widget.assetPath);
    }
    return AnimatedOpacity(
      opacity: _controller.value.isInitialized ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: AppDimens.videoPlayerSize,
        width: AppDimens.videoPlayerSize * _controller.value.aspectRatio,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: const Offset(0, 2),
              blurRadius: 7,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: GestureDetector(
            onTap: _onVideoTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDimens.borderRadiusMedium),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
                Visibility(
                  visible: !_controller.value.isPlaying,
                  child: Container(
                    width: AppDimens.videoPlayerButtonSize,
                    height: AppDimens.videoPlayerButtonSize,
                    decoration: BoxDecoration(
                      color: AppColors.mainGreen,
                      borderRadius:
                          BorderRadius.circular(AppDimens.borderRadiusMedium),
                    ),
                    child: const Icon(
                      AppIcons.play,
                      size: AppDimens.iconSizeLarge,
                    ),
                  ),
                ),
                if (widget.cornerIcon != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(AppDimens.borderRadiusMedium),
                          bottomRight:
                              Radius.circular(AppDimens.borderRadiusMedium),
                        ),
                      ),
                      child: Icon(
                        widget.cornerIcon,
                        size: AppDimens.iconSizeSmall,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _changeVideoPath(String path) async {
    await _controller.dispose();
    _controller = VideoPlayerController.asset(
      widget.assetPath,
    );
    await _controller.initialize().then((_) => setState(() {}));
  }

  void _onVideoTap() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
