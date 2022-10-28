import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/button/back_button.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';
import 'package:gts_learn/presentation/widget/gts_video_player.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key, required this.word});

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppDimens.d8),
            child: GTSBackButton(
              text: context.str.general__back_to_lesson,
              onPressed: () => _onBackButtonPressed(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.d20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacers.h40,
                Text(
                  word.name,
                  style: appTextTheme().headline1,
                ),
                AppSpacers.h16,
                Text(word.description),
                AppSpacers.h32,
                const Center(child: GTSVideoPlayer()),
                AppSpacers.h20,
                const Divider(),
                AppSpacers.h24,
                Center(child: Text(context.str.word_details__watch_video)),
                AppSpacers.h16,
                ButtonWithIcon(
                  text: context.str.word_details__start_presenting,
                  subText: context.str.word_details__using_camera,
                  icon: AppIcons.play,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) =>
      Navigator.of(context).pop();
}
