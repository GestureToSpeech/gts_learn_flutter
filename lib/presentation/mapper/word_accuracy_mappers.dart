import 'package:gts_learn/domain/model/word_entity.dart';

extension WordAccuracyMapper on WordStatus {
  String toText() {
    switch (this) {
      case WordStatus.incorrect:
        return 'incorrect';
      case WordStatus.decent:
        return 'decent';
      case WordStatus.great:
        return 'great';
      case WordStatus.notLearnt:
        return 'not learnt';
    }
  }
}
