import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({super.key, required this.lesson, this.isOneLine = false});

  final LessonEntity lesson;
  final bool isOneLine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onLessonPressed(context),
      child: Opacity(
        opacity: lesson.status == LessonStatus.locked ? 0.5 : 1,
        child: Container(
          height: isOneLine
              ? AppDimens.lessonTileOneLineHeight
              : AppDimens.lessonTileTwoLineHeight,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.d16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimens.borderRadiusMedium),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: AppDimens.lessonTileBlurRadius,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: isOneLine
              ? Row(
                  children: [
                    Flexible(flex: 3, child: _LessonNameSection(lesson)),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.d12,
                      ),
                      child: VerticalDivider(
                        indent: AppDimens.d16,
                        endIndent: AppDimens.d16,
                      ),
                    ),
                    Flexible(flex: 2, child: _LessonInfoSection(lesson)),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _LessonNameSection(lesson),
                    AppSpacers.h8,
                    const Divider(),
                    _LessonInfoSection(lesson),
                  ],
                ),
        ),
      ),
    );
  }

  void _onLessonPressed(BuildContext context) {
    if (lesson.status == LessonStatus.locked) {
      return;
    }
    context.router.push(LessonDetailsRoute(lesson: lesson));
  }
}

class _LessonNameSection extends StatelessWidget {
  const _LessonNameSection(this.lesson);

  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LessonStatusDot(lesson.status),
        AppSpacers.w12,
        Text(
          lesson.title,
          style: appTextTheme().headline5,
        ),
        const Spacer(),
        Icon(
          lesson.icon,
          size: AppDimens.lessonTileLessonIconSize,
        ),
      ],
    );
  }
}

class _LessonInfoSection extends StatelessWidget {
  const _LessonInfoSection(this.lesson);

  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(AppIcons.clock),
        AppSpacers.w8,
        Text(
          '${lesson.estimatedTime} ${context.str.lesson_minutes}',
          style: appTextTheme().bodyText1,
        ),
        const Spacer(),
        const Icon(AppIcons.gesture),
        Text(
          '${lesson.learntWords}/${lesson.words.length} ${context.str.lesson_questions}',
          style: appTextTheme().bodyText1,
        ),
      ],
    );
  }
}

class _LessonStatusDot extends StatelessWidget {
  const _LessonStatusDot(this.status);

  final LessonStatus status;

  @override
  Widget build(BuildContext context) {
    return status != LessonStatus.locked && status != LessonStatus.completed
        ? Container(
            width: AppDimens.lessonTileDotSize,
            height: AppDimens.lessonTileDotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status == LessonStatus.inProgress
                  ? AppColors.mainGreen
                  : null,
              border: status == LessonStatus.notStarted
                  ? Border.all(
                      color: AppColors.mainGreen,
                      width: AppDimens.lessonTileDotBorderThickness,
                    )
                  : null,
            ),
          )
        : Icon(
            status == LessonStatus.locked ? AppIcons.lessonLock : AppIcons.done,
            size: AppDimens.lessonTileStatusIconSize,
          );
  }
}
