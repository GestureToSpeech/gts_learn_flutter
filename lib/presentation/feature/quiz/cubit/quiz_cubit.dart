import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:injectable/injectable.dart';

part 'quiz_cubit.freezed.dart';
part 'quiz_state.dart';

@injectable
class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState.initial());

  Future<void> init(List<QuizQuestion> questions) async =>
      emit(QuizState.play(questions: questions, currentQuestion: questions[0]));

  // ######### PLAY STATE  #########

  void updatePressedAnswer(QuizAnswer answer) {
    state.mapOrNull(
      play: (state) {
        final isSelected =
            state.currentQuestion.selectedAnswers.contains(answer);

        late QuizQuestion updatedQuestion;
        switch (state.currentQuestion.questionType) {
          case QuestionType.singleChoice:
            updatedQuestion = state.currentQuestion
                .copyWith(selectedAnswers: isSelected ? [] : [answer]);
            break;
          case QuestionType.multipleChoice:
            final selectedAnswers = state.currentQuestion.selectedAnswers;
            updatedQuestion = state.currentQuestion.copyWith(
              selectedAnswers: isSelected
                  ? selectedAnswers.where((value) => value != answer).toList()
                  : [...selectedAnswers, answer],
            );
        }
        emit(state.copyWith(currentQuestion: updatedQuestion));
      },
    );
  }

  void changeQuestion(int newIndex) {
    state.mapOrNull(
      play: (state) {
        emit(
          state.copyWith(
            questions: _updateQuestionList()!,
            currentQuestionIndex: newIndex,
            currentQuestion: state.questions[newIndex],
          ),
        );
      },
    );
  }

  void submit() {
    state.mapOrNull(
      play: (state) {
        final updatedQuestions = _updateQuestionList();
        emit(QuizState.results(questions: updatedQuestions!));
      },
    );
  }

  List<QuizQuestion>? _updateQuestionList() {
    state.mapOrNull(
      play: (state) {
        final updatedList = [
          ...state.questions.sublist(0, state.currentQuestionIndex),
          state.currentQuestion,
          ...state.questions.sublist(state.currentQuestionIndex)
        ];
        return updatedList;
      },
    );
    return null;
  }

  // ######### RESULTS STATE  #########

}
