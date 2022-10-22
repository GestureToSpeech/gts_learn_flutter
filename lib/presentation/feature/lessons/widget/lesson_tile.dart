import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({super.key, required this.lesson});

  final LessonEntity lesson;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lesson.status == LessonStatus.locked ? 0.5 : 1,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                  size: 40,
                ),
              ],
            ),
            AppSpacers.h8,
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
            Row(
              children: [
                const Icon(AppIcons.clock),
                AppSpacers.w8,
                Text(
                  '${lesson.estimatedTime} minutes',
                  style: appTextTheme().bodyText1,
                ),
                const Spacer(),
                const Icon(AppIcons.gesture),
                Text(
                  '${lesson.learntWords}/${lesson.words.length} questions',
                  style: appTextTheme().bodyText1,
                ),
              ],
            ),
          ],
        ),
      ),
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
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status == LessonStatus.inProgress
                  ? AppColors.mainGreen
                  : null,
              border: status == LessonStatus.notStarted
                  ? Border.all(
                      color: AppColors.mainGreen,
                      width: 3,
                    )
                  : null,
            ),
          )
        : Icon(
            status == LessonStatus.locked ? AppIcons.lessonLock : AppIcons.done,
            size: 20,
          );
  }
}
