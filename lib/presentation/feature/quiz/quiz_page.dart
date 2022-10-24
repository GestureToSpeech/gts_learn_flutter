import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/quiz/cubit/quiz_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/widget/question_section.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';
import 'package:gts_learn/presentation/widget/gts_video_player.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) => state.whenOrNull(),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        play: _QuizPageBody.new,
        result: _QuizResult.new,
        orElse: () => const SizedBox(),
      ),
    );
  }
}

class _QuizPageBody extends StatelessWidget {
  const _QuizPageBody(
    this.questions,
    this.currentQuestion,
    this.currentQuestionIndex,
  );

  final List<QuizQuestion> questions;
  final QuizQuestion currentQuestion;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    final isLast = currentQuestionIndex + 1 == questions.length;
    final isFirst = currentQuestionIndex != 0;
    final isButtonEnabled = currentQuestion.isAnswerRequired &&
        currentQuestion.selectedAnswers.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyRichText(
            '${currentQuestionIndex + 1} /${questions.length}',
            patternList: [
              EasyRichTextPattern(
                targetString: (currentQuestionIndex + 1).toString(),
                matchWordBoundaries: false,
                stringAfterTarget: ' /',
                style: appTextTheme().headline1,
              ),
            ],
          ),
          const GTSVideoPlayer(),
          AppSpacers.h20,
          Text(context.str.quiz__choose_word),
          AppSpacers.h20,
          QuestionSection(
            question: currentQuestion,
            onAnswerPressed: (answer) => _onAnswerPressed(context, answer),
          ),
          AppSpacers.h32,
          ButtonWithIcon(
            icon: isButtonEnabled ? AppIcons.next : AppIcons.lock,
            onPressed: isButtonEnabled
                ? isLast
                    ? () => _onSubmitQuizButtonPressed(context)
                    : () => _onNextQuestionButtonPressed(context)
                : null,
            text: isLast
                ? context.str.quiz__finish
                : context.str.quiz__next_question,
          ),
          if (isFirst)
            TextButton(
              onPressed: () => _onPreviousQuestionButtonPressed(context),
              child: Text(context.str.quiz__previous_question),
            ),
        ],
      ),
    );
  }

  void _onNextQuestionButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().changeQuestion(currentQuestionIndex + 1);

  void _onSubmitQuizButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().submit();

  void _onPreviousQuestionButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().changeQuestion(currentQuestionIndex - 1);

  void _onAnswerPressed(BuildContext context, WordEntity answer) =>
      context.read<QuizCubit>().updatePressedAnswer(answer);
}

class _QuizResult extends StatelessWidget {
  const _QuizResult(this.questions);

  final List<QuizQuestion> questions;

  @override
  Widget build(BuildContext context) {
    final areAllCorrect = questions
            .where(
              (element) => element.selectedAnswers == element.correctAnswers,
            )
            .length ==
        questions.length;

    return Column(
      children: [
        Text(
          areAllCorrect ? context.str.quiz__success : context.str.quiz__failure,
          style: appTextTheme().headline2,
        ),
        AppSpacers.h12,
        Text(
          areAllCorrect
              ? context.str.quiz__success_desc
              : context.str.quiz__failure_desc,
          style: appTextTheme().bodyText2,
        ),
        AppSpacers.h24,
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ..._buildResultList(),
              ],
            ),
          ),
        ),
        AppSpacers.h40,
        ButtonWithIcon(
          text: context.str.quiz__try_again,
          icon: AppIcons.backArrow,
          onPressed: () => _onTryAgainButtonPressed(context),
        ),
        AppSpacers.h16,
        TextButton(
          onPressed: () => _onReturnToLessonsButtonPressed(context),
          child: Text(context.str.quiz__go_to_lessons),
        ),
      ],
    );
  }

  void _onTryAgainButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().tryAgain();

  void _onReturnToLessonsButtonPressed(BuildContext context) =>
      context.router.replace(const LessonsRoute());

  List<Widget> _buildResultList() => questions
      .mapIndexed((index, question) => _QuizResultItem(question, index))
      .toList();
}

class _QuizResultItem extends StatelessWidget {
  const _QuizResultItem(this.question, this.index);

  final QuizQuestion question;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isCorrect = question.selectedAnswers.equals(question.correctAnswers);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.quizResultsAnswerPadding,
        vertical: AppDimens.d8,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.d10),
        decoration: BoxDecoration(
          color: isCorrect ? null : AppColors.wrongAnswerBackground,
          borderRadius:
              BorderRadius.circular(AppDimens.quizResultsAnswerBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimens.quizResultsAnswerIconSize,
              height: AppDimens.quizResultsAnswerIconSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.quizAnswerGray,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: appTextTheme().bodyText1,
                ),
              ),
            ),
            AppSpacers.w16,
            SizedBox(
              width: AppDimens.quizResultsAnswerTextWidth,
              child: Text(
                isCorrect ? context.str.quiz__correct : context.str.quiz__wrong,
                style: appTextTheme().headline5,
              ),
            ),
            AppSpacers.w16,
            Container(
              width: AppDimens.quizResultsAnswerIconSize,
              height: AppDimens.quizResultsAnswerIconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isCorrect ? AppColors.mainGreen : AppColors.wrongAnswerMain,
              ),
              child: Icon(
                isCorrect ? AppIcons.done : AppIcons.fail,
                size: AppDimens.quizResultsAnswerIconSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
