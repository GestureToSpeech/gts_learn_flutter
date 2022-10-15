import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/lessons/cubit/lessons_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        idle: () => const _LessonsPageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _LessonsPageBody extends StatelessWidget {
  const _LessonsPageBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _onButtonPressed(context),
          child: const Text('Go to the quiz'),
        ),
      ],
    );
  }

  void _onButtonPressed(BuildContext context) =>
      context.router.replace(QuizPage(questions: questions));
}

List<QuizQuestion> questions = [
  const QuizQuestion(
    description: 'Choose word which fits video above.',
    answers: [
      QuizAnswer(label: 'Dinner'),
      QuizAnswer(label: 'Lunch'),
      QuizAnswer(label: 'Breakfast'),
      QuizAnswer(label: 'Waiter'),
      QuizAnswer(label: 'Bill'),
    ],
    correctAnswers: [QuizAnswer(label: 'Dinner')],
  ),
  const QuizQuestion(
    description: 'Choose word which fits video above.',
    answers: [
      QuizAnswer(label: 'Dinner'),
      QuizAnswer(label: 'Lunch'),
      QuizAnswer(label: 'Breakfast'),
      QuizAnswer(label: 'Waiter'),
      QuizAnswer(label: 'Bill'),
    ],
    correctAnswers: [QuizAnswer(label: 'Lunch')],
  ),
  const QuizQuestion(
    description: 'Choose word which fits video above.',
    answers: [
      QuizAnswer(label: 'Dinner'),
      QuizAnswer(label: 'Lunch'),
      QuizAnswer(label: 'Breakfast'),
      QuizAnswer(label: 'Waiter'),
      QuizAnswer(label: 'Bill'),
    ],
    correctAnswers: [QuizAnswer(label: 'Breakfast')],
  ),
];
