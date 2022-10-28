import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/button/back_button.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';
import 'package:gts_learn/presentation/widget/gts_video_player.dart';

enum WordDetailsType { lesson, dictionary }

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key, required this.word, required this.type});

  final WordEntity word;
  final WordDetailsType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.isTablet ? AppDimens.d20 : 0,
          ),
          child: Column(
            children: [
              const Divider(),
              AppSpacers.h12,
              Padding(
                padding: const EdgeInsets.only(left: AppDimens.d8),
                child: GTSBackButton(
                  text: type == WordDetailsType.dictionary
                      ? context.str.general__back
                      : context.str.general__back_to_lesson,
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
                    Center(
                      child: GTSVideoPlayer(
                        assetPath: word.videoAssetPath,
                      ),
                    ),
                    AppSpacers.h20,
                    const Divider(),
                    AppSpacers.h24,
                    Center(child: Text(context.str.word_details__watch_video)),
                    AppSpacers.h16,
                    if (type == WordDetailsType.lesson)
                      Center(
                        child: SizedBox(
                          width: AppDimens.wordDetailsButtonWidth,
                          child: ButtonWithIcon(
                            text: context.str.word_details__start_presenting,
                            subText: context.str.word_details__using_camera,
                            icon: AppIcons.play,
                          ),
                        ),
                      )
                    else
                      _GoToLessonButton(word),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) =>
      Navigator.of(context).pop();
}

class _GoToLessonButton extends StatelessWidget {
  const _GoToLessonButton(this.word);

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppDimens.wordDetailsButtonWidth,
        child: ButtonWithIcon(
          text: word.isLearnt
              ? context.str.word_details__try_again
              : context.str.word_details__go_to_lesson,
          icon: AppIcons.play,
        ),
      ),
    );
  }
}
