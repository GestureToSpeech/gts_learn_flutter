part of 'quiz_cubit.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial() = _Initial;
  const factory QuizState.loading() = _Loading;
  const factory QuizState.play({
    required List<QuizQuestion> questions,
    required QuizQuestion currentQuestion,
    required LessonEntity lesson,
    @Default(0) int currentQuestionIndex,
  }) = _Play;
  const factory QuizState.result({
    required List<QuizQuestion> questions,
    required LessonEntity lesson,
  }) = _Result;
}
