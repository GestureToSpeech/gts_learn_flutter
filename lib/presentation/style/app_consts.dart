import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';

class AppConsts {
  AppConsts._();

  static final lessons = [
    LessonEntity(
      id: 1,
      title: 'Restaurant & Cooking',
      estimatedTime: 14,
      icon: AppIcons.cooking,
      status: LessonStatus.notStarted,
      words: restaurantWords,
    ),
    LessonEntity(
      id: 2,
      title: 'Online business',
      estimatedTime: 18,
      icon: AppIcons.computer,
      status: LessonStatus.inProgress,
      words: businessWords,
    ),
    LessonEntity(
      id: 3,
      title: 'How will I get to?',
      estimatedTime: 18,
      icon: AppIcons.map,
      status: LessonStatus.locked,
      words: howCanIWords,
    ),
    LessonEntity(
      id: 4,
      title: 'How will I get to?',
      estimatedTime: 18,
      icon: AppIcons.map,
      status: LessonStatus.completed,
      words: howCanIWords,
    ),
  ];

  static final restaurantWords = [
    const WordEntity(
      id: 1,
      name: 'Dinner',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 2,
      name: 'Breakfast',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 3,
      name: 'Lunch',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 4,
      name: 'Brunch',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 5,
      name: 'Bill',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
  ];

  static final businessWords = [
    const WordEntity(
      id: 6,
      name: 'Computer',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 7,
      name: 'Money',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 8,
      name: 'Work',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 9,
      name: 'Salary',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 10,
      name: 'Business',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.decent,
    ),
  ];

  static final howCanIWords = [
    const WordEntity(
      id: 11,
      name: 'Dinner',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 12,
      name: 'Breakfast',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 13,
      name: 'Lunch',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 14,
      name: 'Brunch',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 15,
      name: 'Bill',
      description: 'description',
      videoAssetPath: 'videoAssetPath',
      accuracyStatus: WordStatus.notLearnt,
    ),
  ];
}
