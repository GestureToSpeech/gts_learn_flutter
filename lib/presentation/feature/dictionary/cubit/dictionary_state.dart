part of 'dictionary_cubit.dart';

@freezed
class DictionaryState with _$DictionaryState {
  const factory DictionaryState.initial() = _Initial;
  const factory DictionaryState.loading() = _Loading;
  const factory DictionaryState.idle({@Default('') String searchPhrase}) =
      _Idle;
  const factory DictionaryState.failure() = _Failure;
}
