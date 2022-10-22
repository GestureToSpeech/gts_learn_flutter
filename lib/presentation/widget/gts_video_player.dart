import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:video_player/video_player.dart';

class GTSVideoPlayer extends StatefulWidget {
  const GTSVideoPlayer({super.key});

  @override
  State<GTSVideoPlayer> createState() => _GTSVideoPlayerState();
}

class _GTSVideoPlayerState extends State<GTSVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      AppAssets.testVideo,
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
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
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
        ],
      ),
    );
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
