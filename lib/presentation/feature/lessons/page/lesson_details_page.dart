import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/word_details/word_details_page.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/utils/quiz_questions_generator.dart';
import 'package:gts_learn/presentation/widget/button/back_button.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage({super.key, required this.lesson});

  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.isTablet ? AppDimens.d40 : AppDimens.d16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderSection(lesson),
            AppSpacers.h16,
            const Divider(),
            AppSpacers.h16,
            ..._getWords(lesson.words),
            AppSpacers.h40,
            _StartQuizSection(
              isActive: lesson.isQuizAvailable,
              lesson: lesson,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getWords(List<WordEntity> words) {
    return words.map(_WordTile.new).toList();
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection(this.lesson);

  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GTSBackButton(
            text: context.str.general__back,
            onPressed: () => _onBackButtonPressed(context),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.d8,
              right: AppDimens.d24,
            ),
            child: SizedBox(
              width: AppDimens.isTablet
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width / 2.5,
              child: Text(
                lesson.title,
                textAlign: TextAlign.center,
                style: AppDimens.isTablet
                    ? appTextTheme().headline1
                    : appTextTheme().headline3,
              ),
            ),
          ),
          Icon(
            lesson.icon,
            size: AppDimens.lessonDetailsIconSize,
          ),
        ],
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) {
    context.router.pop();
  }
}

class _WordTile extends StatelessWidget {
  const _WordTile(this.word);

  final WordEntity word;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onWordTilePressed(context),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.d12,
                  vertical: AppDimens.d12,
                ),
                child: Text(
                  word.name,
                  style: AppDimens.isTablet
                      ? appTextTheme().headline5
                      : appTextTheme().bodyText1,
                ),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _onWordTilePressed(BuildContext context) {
    context.router
        .push(WordDetailsRoute(word: word, type: WordDetailsType.lesson));
  }
}

class _StartQuizSection extends StatelessWidget {
  const _StartQuizSection({required this.isActive, required this.lesson});

  final bool isActive;
  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d8),
      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: 100,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.circular(AppDimens.startQuizBorderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withOpacity(0.25),
                spreadRadius: AppDimens.startQuizSpreadRadius,
                blurRadius: AppDimens.startQuizBlurRadius,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.d20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        AppDimens.d16,
                        0,
                        AppDimens.d16,
                        AppDimens.isTablet ? AppDimens.d2 : AppDimens.d20,
                      ),
                      child: !isActive
                          ? const Icon(
                              AppIcons.lessonLock,
                              size: AppDimens.lessonDetailsIndicatorIconSize,
                            )
                          : Container(
                              width: AppDimens.lessonDetailsIndicatorSize,
                              height: AppDimens.lessonDetailsIndicatorSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.mainGreen,
                                  width: AppDimens
                                      .lessonDetailsIndicatorBorderWidth,
                                ),
                              ),
                            ),
                    ),
                    Flexible(
                      child: Text(
                        isActive
                            ? context.str.lesson__start
                            : context.str.lesson__locked,
                        style: appTextTheme().headline5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.d16),
                      child: Icon(
                        AppIcons.lessons,
                        size: AppDimens.lessonDetailsIconSize,
                      ),
                    ),
                  ],
                ),
                if (isActive)
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppDimens.d16,
                      left: AppDimens.d20,
                      right: AppDimens.isTablet ? AppDimens.d40 : AppDimens.d20,
                    ),
                    child: SizedBox(
                      width: AppDimens.isTablet
                          ? MediaQuery.of(context).size.width / 3
                          : null,
                      child: ElevatedButton(
                        onPressed: () => _onPlayButtonPressed(context),
                        child: Text(
                          context.str.lesson__quiz_start,
                          style: appTextTheme()
                              .headline5
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPlayButtonPressed(BuildContext context) => context.router.push(
        QuizPage(
          questions:
              QuizQuestionsGenerator.generateQuestions(answers: lesson.words),
          lesson: lesson,
        ),
      );
}
