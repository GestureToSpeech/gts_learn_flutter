import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/word_entity.dart';

part 'quiz_question.freezed.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String description,
    required List<WordEntity> answers,
    required List<WordEntity> correctAnswers,
    @Default([]) List<WordEntity> selectedAnswers,
    @Default(QuestionType.singleChoice) QuestionType questionType,
    String? videoAssetPath,
  }) = _QuizQuestion;
}

enum QuestionType { singleChoice, multipleChoice }
