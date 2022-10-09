import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'lesson_details_cubit.freezed.dart';
part 'lesson_details_state.dart';

@injectable
class LessonDetailsCubit extends BaseCubit<LessonDetailsState> {
  LessonDetailsCubit() : super(const LessonDetailsState.initial());


  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
