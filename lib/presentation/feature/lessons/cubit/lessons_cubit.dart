import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'lessons_cubit.freezed.dart';
part 'lessons_state.dart';

@injectable
class LessonsCubit extends BaseCubit<LessonsState> {
  LessonsCubit() : super(const LessonsState.initial());

  @override
  Future<void> init() async => emit(const LessonsState.idle());
}
