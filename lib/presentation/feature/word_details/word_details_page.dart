import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/widget/button/back_button.dart';
import 'package:gts_learn/presentation/widget/gts_video_player.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key, required this.word});

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GTSBackButton(onPressed: () => _onBackButtonPressed(context)),
        Container(),
        const GTSVideoPlayer(),
      ],
    );
  }

  void _onBackButtonPressed(BuildContext context) =>
      Navigator.of(context).pop();
}
