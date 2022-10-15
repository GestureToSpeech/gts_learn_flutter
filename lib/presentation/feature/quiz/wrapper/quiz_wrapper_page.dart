import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/quiz/cubit/quiz_cubit.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/quiz_page.dart';

class QuizWrapperPage extends StatelessWidget {
  const QuizWrapperPage({super.key, required this.questions});

  final List<QuizQuestion> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<QuizCubit>()..init(questions),
        lazy: false,
        child: const QuizPage(),
      ),
    );
  }
}
