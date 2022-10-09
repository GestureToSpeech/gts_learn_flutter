part of 'lesson_details_cubit.dart';

@freezed
class LessonDetailsState with _$LessonDetailsState {
const factory LessonDetailsState.initial() = _Initial;
const factory LessonDetailsState.loading() = _Loading;
const factory LessonDetailsState.success() = _Success;
const factory LessonDetailsState.failure() = _Failure;
}
