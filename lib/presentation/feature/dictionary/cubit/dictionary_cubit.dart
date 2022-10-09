import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'dictionary_cubit.freezed.dart';
part 'dictionary_state.dart';

@injectable
class DictionaryCubit extends BaseCubit<DictionaryState> {
  DictionaryCubit() : super(const DictionaryState.initial());

  @override
  Future<void> init() async {}
}
