import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
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
  final void Function(QuizAnswer) onAnswerPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: AppDimens.d12,
        runSpacing: AppDimens.d8,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [..._getQuestionAnswers(question.answers)],
      ),
    );
  }

  List<Widget> _getQuestionAnswers(List<QuizAnswer> answers) => answers
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

  final QuizAnswer answer;
  final bool isPressed;
  final void Function(QuizAnswer) onPressed;

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
            color:
                isPressed ? AppColors.buttonEnabled : AppColors.buttonDisabled,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.d16),
            child: Text(
              answer.label,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
