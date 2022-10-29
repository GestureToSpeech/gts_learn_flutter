import 'package:auto_route/auto_route.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/bloc/app_data/app_data_cubit.dart';
import 'package:gts_learn/presentation/mapper/word_accuracy_mappers.dart';
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
                      style: AppDimens.isTablet
                          ? appTextTheme().tabletHeadline3
                          : appTextTheme().headline1,
                    ),
                    AppSpacers.h16,
                    SizedBox(
                      width: AppDimens.isTablet
                          ? MediaQuery.of(context).size.width / 1.5
                          : null,
                      child: Text(word.description),
                    ),
                    AppSpacers.h32,
                    Center(
                      child: GTSVideoPlayer(
                        assetPath: word.videoAssetPath,
                      ),
                    ),
                    AppSpacers.h20,
                    if (type == WordDetailsType.lesson)
                      _LessonDetailsSection(word)
                    else
                      _DictionaryDetailsSection(word),
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

class _LessonDetailsSection extends StatelessWidget {
  const _LessonDetailsSection(this.word);

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        AppSpacers.h24,
        Center(child: Text(context.str.word_details__watch_video)),
        AppSpacers.h16,
        Center(
          child: SizedBox(
            width: AppDimens.wordDetailsButtonWidth,
            child: ButtonWithIcon(
              text: context.str.word_details__start_presenting,
              subText: context.str.word_details__using_camera,
              icon: AppIcons.play,
              onPressed: () => _onStartPresentingPressed(context),
            ),
          ),
        ),
      ],
    );
  }

  void _onStartPresentingPressed(BuildContext context) =>
      context.router.push(const PresentationRoute());
}

class _DictionaryDetailsSection extends StatelessWidget {
  const _DictionaryDetailsSection(this.word);

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    final lesson = _getWordLesson(context, word);
    return Column(
      children: [
        Text(
          word.isLearnt
              ? context.str.word_details__congratulations
              : context.str.word_details__not_learnt,
          style: appTextTheme().headline3,
        ),
        AppSpacers.h16,
        EasyRichText(
          word.isLearnt
              ? context.str.word_details__learnt_desc(
                  word.accuracyStatus.toText(),
                )
              : context.str.word_details__not_learnt_desc(lesson.title),
          patternList: [
            EasyRichTextPattern(
              targetString: "'${lesson.title}'",
              style: appTextTheme().bodyText1,
            ),
            EasyRichTextPattern(
              targetString: word.accuracyStatus.toText(),
              style: appTextTheme().bodyText1,
            ),
          ],
        ),
        AppSpacers.h12,
        Center(
          child: SizedBox(
            width: AppDimens.wordDetailsButtonWidth,
            child: ButtonWithIcon(
              text: word.isLearnt
                  ? context.str.word_details__try_again
                  : context.str.word_details__go_to_lesson,
              icon: AppIcons.play,
              onPressed: word.isLearnt
                  ? _onTryAgainButtonPressed(context)
                  : _onGoToLessonButtonPressed(context, lesson),
            ),
          ),
        ),
      ],
    );
  }

  void Function() _onTryAgainButtonPressed(BuildContext context) =>
      () => Navigator.of(context).pop();

  void Function() _onGoToLessonButtonPressed(
    BuildContext context,
    LessonEntity lesson,
  ) =>
      () => context.navigateTo(
            LessonsRouter(children: [LessonDetailsRoute(lesson: lesson)]),
          );

  LessonEntity _getWordLesson(BuildContext context, WordEntity word) =>
      context.read<AppDataCubit>().getLessonByWord(word);
}
