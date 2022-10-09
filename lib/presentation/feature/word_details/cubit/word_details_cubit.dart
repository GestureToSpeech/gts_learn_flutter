import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'word_details_cubit.freezed.dart';
part 'word_details_state.dart';

@injectable
class WordDetailsCubit extends BaseCubit<WordDetailsState> {
  WordDetailsCubit() : super(const WordDetailsState.initial());


  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
