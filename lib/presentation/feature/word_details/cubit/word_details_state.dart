part of 'word_details_cubit.dart';

@freezed
class WordDetailsState with _$WordDetailsState {
const factory WordDetailsState.initial() = _Initial;
const factory WordDetailsState.loading() = _Loading;
const factory WordDetailsState.success() = _Success;
const factory WordDetailsState.failure() = _Failure;
}
