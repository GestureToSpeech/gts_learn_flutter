import 'package:auto_route/auto_route.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/word_results/cubit/word_results_cubit.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_consts.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';

class WordResultsPage extends StatelessWidget {
  const WordResultsPage({
    super.key,
    required this.percentAccuracy,
    required this.wordId,
  });

  final int percentAccuracy;
  final int wordId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<WordResultsCubit>()..init(),
        lazy: false,
        child: _WordResultsPageCore(
          percentAccuracy: percentAccuracy,
          wordId: wordId,
        ),
      ),
    );
  }
}

class _WordResultsPageCore extends StatelessWidget {
  const _WordResultsPageCore({
    required this.percentAccuracy,
    required this.wordId,
  });

  final int percentAccuracy;
  final int wordId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordResultsCubit, WordResultsState>(
      builder: (context, state) =>
          _WordResultsPageBody(percentAccuracy, wordId),
    );
  }
}

class _WordResultsPageBody extends StatelessWidget {
  const _WordResultsPageBody(this.accuracy, this.wordId);

  final int accuracy;
  final int wordId;

  @override
  Widget build(BuildContext context) {
    final isSuccess = accuracy >= AppConsts.successThreshold;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          isSuccess ? context.str.quiz__success : context.str.quiz__failure,
          style: appTextTheme().tabletHeadline3,
        ),
        AppSpacers.h16,
        Text(
          isSuccess
              ? context.str.word_results__done_properly
              : context.str.word_results__done_poorly,
          style: appTextTheme().bodyText2,
        ),
        AppSpacers.h40,
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: AppDimens.resultsCirclesSize,
                height: AppDimens.resultsCirclesSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
              Container(
                width: (accuracy / 100) * AppDimens.resultsCirclesSize,
                height: (accuracy / 100) * AppDimens.resultsCirclesSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getCircleColor(accuracy),
                ),
              ),
            ],
          ),
        ),
        AppSpacers.h40,
        Text(context.str.word_results__accuracy),
        AppSpacers.h16,
        EasyRichText(
          '${accuracy.toString()} %',
          patternList: [
            EasyRichTextPattern(
              targetString: accuracy.toString(),
              matchWordBoundaries: false,
              style: appTextTheme().headline1,
            ),
          ],
        ),
        const Spacer(),
        _ButtonsSection(
          isSuccess: isSuccess,
          wordId: wordId,
        ),
      ],
    );
  }

  Color _getCircleColor(int accuracy) {
    if (accuracy >= 70) {
      return AppColors.mainGreen.withOpacity(accuracy / 100);
    } else if (accuracy > 40 && accuracy < 70) {
      return AppColors.mainYellow;
    } else {
      return AppColors.requirementRed.withOpacity(1 - accuracy / 100);
    }
  }
}

class _ButtonsSection extends StatelessWidget {
  const _ButtonsSection({required this.isSuccess, required this.wordId});

  final bool isSuccess;
  final int wordId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSuccess)
          SizedBox(
            width: AppDimens.wordDetailsButtonWidth,
            child: ButtonWithIcon(
              text: context.str.general__go_back,
              subText: context.str.general__to_lessons,
              icon: AppIcons.lessons,
              onPressed: () => _onBackToLessonsPressed(context),
            ),
          )
        else
          SizedBox(
            width: AppDimens.wordDetailsButtonWidth,
            child: ButtonWithIcon(
              text: context.str.general__try_again,
              subText: context.str.word_results__better_results,
              icon: AppIcons.backArrow,
              onPressed: () => _onTryAgainPressed(context, wordId),
            ),
          ),
        AppSpacers.h12,
        if (isSuccess)
          TextButton(
            onPressed: () => _onTryAgainPressed(context, wordId),
            child: Text(
              context.str.general__try_again,
            ),
          )
        else
          TextButton(
            onPressed: () => _onBackToLessonsPressed(context),
            child: Text(
              context.str.general__back_to_lessons,
            ),
          ),
      ],
    );
  }

  void _onBackToLessonsPressed(BuildContext context) =>
      context.router.replace(const LessonsRoute());

  void _onTryAgainPressed(BuildContext context, int wordId) =>
      context.router.replace(PresentationRoute(wordId: wordId));
}
