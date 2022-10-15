import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.freezed.dart';

@freezed
class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required String label,
    @Default(false) bool isPicked,
  }) = _QuizAnswer;
}
