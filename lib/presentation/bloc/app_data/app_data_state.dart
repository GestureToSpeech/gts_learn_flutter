part of 'app_data_cubit.dart';

@freezed
class AppDataState with _$AppDataState {
  const factory AppDataState({
    @Default([]) List<LessonEntity> lessons,
  }) = _AppDataState;
}
