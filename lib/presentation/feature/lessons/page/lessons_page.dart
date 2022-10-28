import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/bloc/app_data/app_data_cubit.dart';
import 'package:gts_learn/presentation/feature/lessons/cubit/lessons_cubit.dart';
import 'package:gts_learn/presentation/feature/lessons/widget/lesson_tile.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
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
    return BlocBuilder<AppDataCubit, AppDataState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.d24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacers.h4,
                Text(
                  context.str.main__lessons,
                  style: AppDimens.isTablet
                      ? appTextTheme().tabletHeadline3
                      : appTextTheme().headline3,
                ),
                AppSpacers.h24,
                _LessonsSection(state.lessons),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LessonsSection extends StatelessWidget {
  const _LessonsSection(this.lessons);

  final List<LessonEntity> lessons;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._buildLessons(context, true),
          Text(context.str.lesson__completed, style: appTextTheme().headline3),
          AppSpacers.h16,
          ..._buildLessons(context, false),
        ],
      ),
    );
  }

  List<Widget> _buildLessons(BuildContext context, bool buildUnfinished) {
    late Iterable<LessonEntity> lessonsToBuild;
    if (buildUnfinished) {
      lessonsToBuild =
          lessons.where((lesson) => lesson.status != LessonStatus.completed);
    } else {
      lessonsToBuild =
          lessons.where((lesson) => lesson.status == LessonStatus.completed);
    }
    return lessonsToBuild
        .map(
          (lesson) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.d16),
            child: LessonTile(
              lesson: lesson,
              isOneLine: AppDimens.isTablet,
            ),
          ),
        )
        .toList(growable: false);
  }
}
