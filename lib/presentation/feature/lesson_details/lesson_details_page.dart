import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/lesson_details/cubit/lesson_details_cubit.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LessonDetailsCubit>(
        create: (_) => getIt<LessonDetailsCubit>()..init(),
        child: const _LessonDetailsPageCore(),
      ),
    );
  }
}

class _LessonDetailsPageCore extends StatelessWidget {
  const _LessonDetailsPageCore();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonDetailsCubit, LessonDetailsState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: () => const _LessonDetailsPageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _LessonDetailsPageBody extends StatelessWidget {
  const _LessonDetailsPageBody();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
