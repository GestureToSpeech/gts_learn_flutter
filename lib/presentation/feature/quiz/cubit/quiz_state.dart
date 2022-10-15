part of 'quiz_cubit.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial() = _Initial;
  const factory QuizState.loading() = _Loading;
  const factory QuizState.play({
    required List<QuizQuestion> questions,
    required QuizQuestion currentQuestion,
    @Default(0) int currentQuestionIndex,
  }) = _Play;
  const factory QuizState.submitted() = _Submitted;
}
