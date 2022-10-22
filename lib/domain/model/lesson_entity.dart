import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/word_entity.dart';

part 'lesson_entity.freezed.dart';

@freezed
class LessonEntity with _$LessonEntity {
  const factory LessonEntity({
    required int id,
    required String title,
    required int estimatedTime,
    required IconData icon,
    required LessonStatus status,
    required List<WordEntity> words,
  }) = _LessonEntity;

  const LessonEntity._();

  int get learntWords => words.where((element) => element.isLearnt).length;
  bool get isQuizAvailable => learntWords == words.length;
}

enum LessonStatus { completed, inProgress, notStarted, locked }
