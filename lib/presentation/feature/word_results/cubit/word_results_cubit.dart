import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'word_results_state.dart';

@injectable
class WordResultsCubit extends BaseCubit<WordResultsState> {
  WordResultsCubit() : super(WordResultsState());

  @override
  Future<void> init() async {}
}
