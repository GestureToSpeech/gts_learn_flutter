import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/presentation/feature/quiz/cubit/quiz_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/quiz_page.dart';

class QuizWrapperPage extends StatelessWidget {
  const QuizWrapperPage({
    super.key,
    required this.questions,
    required this.lesson,
  });

  final List<QuizQuestion> questions;
  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuizCubit>()..init(questions, lesson),
      lazy: false,
      child: const QuizPage(),
    );
  }
}
