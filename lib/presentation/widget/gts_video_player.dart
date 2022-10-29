import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:video_player/video_player.dart';

class GTSVideoPlayer extends StatefulWidget {
  const GTSVideoPlayer({super.key, required this.assetPath});

  final String assetPath;

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
    return SizedBox(
      height: AppDimens.isTablet ? 440 : 195,
      width: MediaQuery.of(context).size.width * _controller.value.aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: const Offset(0, 3),
              blurRadius: 7,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: _controller.value.isInitialized
              ? GestureDetector(
                  onTap: _onVideoTap,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      Visibility(
                        visible: !_controller.value.isPlaying,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.mainGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            AppIcons.play,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
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
