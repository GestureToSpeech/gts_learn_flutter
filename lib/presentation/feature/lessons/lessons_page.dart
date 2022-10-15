import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/lessons/cubit/lessons_cubit.dart';
import 'package:gts_learn/presentation/utils/quiz_questions_generator.dart';
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

  void _onButtonPressed(BuildContext context) => context.router
      .replace(QuizPage(questions: QuizQuestionsGenerator.generateQuestions()));
}
