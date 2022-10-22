import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_entity.freezed.dart';

@freezed
class WordEntity with _$WordEntity {
  const factory WordEntity({
    required String id,
    required String name,
    required String description,
    required String videoAssetPath,
    required WordStatus accuracyStatus,
  }) = _WordEntity;

  const WordEntity._();

  bool get isLearnt =>
      accuracyStatus != WordStatus.notLearnt &&
      accuracyStatus != WordStatus.incorrect;
}

enum WordStatus { incorrect, decent, great, notLearnt }
