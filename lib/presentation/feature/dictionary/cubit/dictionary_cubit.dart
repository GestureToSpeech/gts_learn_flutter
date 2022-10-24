import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:injectable/injectable.dart';

part 'dictionary_cubit.freezed.dart';
part 'dictionary_state.dart';

@injectable
class DictionaryCubit extends BaseCubit<DictionaryState> {
  DictionaryCubit() : super(const DictionaryState.initial());

  @override
  Future<void> init() async => emit(const DictionaryState.idle());

  List<WordEntity> getUniqueWords(
    List<WordEntity> allWords,
    String searchPhrase,
  ) {
    final uniqueWords = <WordEntity>[];
    for (final word in allWords) {
      if (word.name.toLowerCase().contains(searchPhrase.toLowerCase()) &&
          !uniqueWords.any((element) => element.name == word.name)) {
        uniqueWords.add(word);
      }
    }
    return uniqueWords;
  }

  void updateSearchPhrase(String searchPhrase) {
    state.mapOrNull(
      idle: (state) => emit(state.copyWith(searchPhrase: searchPhrase)),
    );
  }
}
