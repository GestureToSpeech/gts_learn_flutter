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
    return Container(
      height: 100,
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
              AppSpacers.w8,
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
          const Divider(),
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
    );
  }
}

class _LessonStatusDot extends StatelessWidget {
  const _LessonStatusDot(this.status);

  final LessonStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status == LessonStatus.inProgress ? AppColors.mainGreen : null,
      ),
    );
  }
}
