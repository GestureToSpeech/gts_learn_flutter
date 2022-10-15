import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';

part 'quiz_question.freezed.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String description,
    required List<QuizAnswer> answers,
    required List<QuizAnswer> correctAnswers,
    @Default([]) List<QuizAnswer> selectedAnswers,
    @Default(QuestionType.singleChoice) QuestionType questionType,
    String? videoAssetPath,
  }) = _QuizQuestion;
}

enum QuestionType { singleChoice, multipleChoice }
