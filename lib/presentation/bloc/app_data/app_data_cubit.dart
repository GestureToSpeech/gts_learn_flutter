import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/style/app_consts.dart';

part 'app_data_state.dart';
part 'app_data_cubit.freezed.dart';

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
}
