import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:injectable/injectable.dart';

part 'quiz_cubit.freezed.dart';
part 'quiz_state.dart';

@injectable
class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState.initial());

  Future<void> init(List<QuizQuestion> questions, LessonEntity lesson) async =>
      emit(
        QuizState.play(
          questions: questions,
          currentQuestion: questions[0],
          lesson: lesson,
        ),
      );

  // ######### PLAY STATE  #########

  void updatePressedAnswer(WordEntity answer) {
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
        emit(
          QuizState.result(
            questions: updatedQuestions!,
            lesson: state.lesson,
          ),
        );
      },
    );
  }

  List<QuizQuestion>? _updateQuestionList() {
    return state.mapOrNull(
      play: (state) {
        final updatedList = [
          ...state.questions.sublist(0, state.currentQuestionIndex),
          state.currentQuestion,
          ...state.questions.sublist(state.currentQuestionIndex + 1)
        ];
        return updatedList;
      },
    );
  }

  // ######### RESULT STATE  #########

  void tryAgain() {
    state.mapOrNull(
      result: (state) {
        final cleanedQuestions = state.questions
            .map((e) => e.copyWith(selectedAnswers: []))
            .toList();
        emit(
          QuizState.play(
            questions: cleanedQuestions,
            currentQuestion: cleanedQuestions.first,
            lesson: state.lesson,
          ),
        );
      },
    );
  }
}
