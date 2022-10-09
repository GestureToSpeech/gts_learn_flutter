part of 'lessons_cubit.dart';

@freezed
class LessonsState with _$LessonsState {
const factory LessonsState.initial() = _Initial;
const factory LessonsState.loading() = _Loading;
const factory LessonsState.success() = _Success;
const factory LessonsState.failure() = _Failure;
}
