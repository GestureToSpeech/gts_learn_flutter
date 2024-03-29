import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
    required this.question,
    required this.onAnswerPressed,
  });

  final QuizQuestion question;
  final void Function(WordEntity) onAnswerPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: AppDimens.isTablet ? AppDimens.d24 : AppDimens.d12,
        runSpacing: AppDimens.d16,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [..._getQuestionAnswers(question.answers)],
      ),
    );
  }

  List<Widget> _getQuestionAnswers(List<WordEntity> answers) => answers
      .map(
        (answer) => _QuestionAnswer(
          answer: answer,
          onPressed: onAnswerPressed,
          isPressed: question.selectedAnswers.contains(answer),
        ),
      )
      .toList();
}

class _QuestionAnswer extends StatelessWidget {
  const _QuestionAnswer({
    required this.answer,
    required this.onPressed,
    required this.isPressed,
  });

  final WordEntity answer;
  final bool isPressed;
  final void Function(WordEntity) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(answer),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: AppDimens.minQuizAnswerHeight,
          minWidth: AppDimens.minQuizAnswerWidth,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isPressed ? AppColors.mainGreen : AppColors.quizAnswerGray,
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.d10),
            child: Text(
              answer.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
