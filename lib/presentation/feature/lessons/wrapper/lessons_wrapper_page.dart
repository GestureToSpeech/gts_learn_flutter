import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/lessons/cubit/lessons_cubit.dart';

class LessonsWrapperPage extends StatelessWidget {
  const LessonsWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => getIt<LessonsCubit>()..init(),
        lazy: false,
        child: const AutoRouter(), // The AutoRouter() widget used here
        // is required to render sub-routes
      ),
    );
  }
}
