import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/quiz/cubit/quiz_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/widget/question_section.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._buildResultList(),
        ElevatedButton(
          onPressed: () => _onTryAgainButtonPressed(context),
          child: const Text('try again'),
        ),
        ElevatedButton(
          onPressed: () => _onReturnToLessonsButtonPressed(context),
          child: const Text('return to lessons'),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text((index + 1).toString()),
        AppSpacers.w8,
        Text(isCorrect ? 'correct' : 'not correct'),
      ],
    );
  }
}
