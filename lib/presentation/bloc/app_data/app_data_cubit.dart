import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/style/app_consts.dart';
import 'package:injectable/injectable.dart';

part 'app_data_cubit.freezed.dart';
part 'app_data_state.dart';

@injectable
class AppDataCubit extends Cubit<AppDataState> {
  AppDataCubit() : super(const AppDataState());

  Future<void> init() async {
    emit(state.copyWith(lessons: AppConsts.lessons));
  }

  List<WordEntity> getLessonsWords() {
    return state.lessons
        .map((element) => element.words)
        .fold([], (previousValue, element) => previousValue + element);
  }

  LessonEntity getLessonByWord(WordEntity word) =>
      state.lessons.firstWhere((element) => element.words.contains(word));

  //@TODO: REWRITE THIS TRASH XD
  void updateWord(int wordId) {
    final updatedLessons = state.lessons.map((e) {
      final containsSearchedWord =
          e.words.where((element) => element.id == wordId).isNotEmpty;
      if (containsSearchedWord) {
        final updatedWords = e.words.map((word) {
          if (word.id == wordId) {
            return word.copyWith(accuracyStatus: WordStatus.great);
          }
          return word;
        });
        return e.copyWith(words: updatedWords.toList());
      }
      return e;
    }).toList();
    emit(state.copyWith(lessons: _updateLessons(updatedLessons)));
  }

  List<LessonEntity> _updateLessons(List<LessonEntity> lessons) => lessons.map(
        (e) {
          final isLearned =
              e.words.where((element) => element.isLearnt).length ==
                  e.words.length;
          if (isLearned) {
            return e.copyWith(status: LessonStatus.inProgress);
          }
          return e;
        },
      ).toList();

  void completeLesson(LessonEntity lesson) {
    final lessons = state.lessons.map((element) {
      if (element.id == lesson.id) {
        return lesson.copyWith(status: LessonStatus.completed);
      }
      return element;
    }).toList();
    emit(state.copyWith(lessons: lessons));
  }

  bool isAnyLessonCompleted() =>
      state.lessons.any((lesson) => lesson.status == LessonStatus.completed);
}
