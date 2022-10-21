import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/quiz/cubit/quiz_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/widget/question_section.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Question ${currentQuestionIndex + 1} out of ${questions.length}'),
        AppSpacers.h16,
        QuestionSection(
          question: currentQuestion,
          onAnswerPressed: (answer) => _onAnswerPressed(context, answer),
        ),
        AppSpacers.h16,
        ElevatedButton(
          onPressed: isLast
              ? () => _onSubmitQuizButtonPressed(context)
              : () => _onNextQuestionButtonPressed(context),
          child: Text(
            isLast ? 'submit' : 'Next question',
          ),
        ),
        ElevatedButton(
          onPressed: currentQuestionIndex != 0
              ? () => _onPreviousQuestionButtonPressed(context)
              : null,
          child: const Text('Prev question'),
        ),
      ],
    );
  }

  void _onNextQuestionButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().changeQuestion(currentQuestionIndex + 1);

  void _onSubmitQuizButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().submit();

  void _onPreviousQuestionButtonPressed(BuildContext context) =>
      context.read<QuizCubit>().changeQuestion(currentQuestionIndex - 1);

  void _onAnswerPressed(BuildContext context, QuizAnswer answer) =>
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
          height: MediaQuery.of(context).size.height / 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ..._buildResultList(),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _onTryAgainButtonPressed(context),
          child: Text(context.str.quiz__try_again),
        ),
        ElevatedButton(
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
        horizontal: 50,
        vertical: AppDimens.d8,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isCorrect ? null : AppColors.wrongAnswerBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
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
              width: 160,
              child: Text(
                isCorrect ? context.str.quiz__correct : context.str.quiz__wrong,
                style: appTextTheme().headline5,
              ),
            ),
            AppSpacers.w16,
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isCorrect ? AppColors.mainGreen : AppColors.wrongAnswerMain,
              ),
              child: Icon(
                Icons.check,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
