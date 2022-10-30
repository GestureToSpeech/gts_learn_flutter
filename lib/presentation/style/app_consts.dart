import 'package:gts_learn/domain/model/lesson_entity.dart';
import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';

class AppConsts {
  AppConsts._();

  static const double successThreshold = 40;

  static final lessons = [
    LessonEntity(
      id: 1,
      title: 'People',
      estimatedTime: 14,
      icon: AppIcons.cooking,
      status: LessonStatus.notStarted,
      words: restaurantWords,
    ),
    LessonEntity(
      id: 2,
      title: 'Activities',
      estimatedTime: 18,
      icon: AppIcons.computer,
      status: LessonStatus.inProgress,
      words: businessWords,
    ),
    LessonEntity(
      id: 3,
      title: 'Something more',
      estimatedTime: 18,
      icon: AppIcons.map,
      status: LessonStatus.locked,
      words: howCanIWords,
    ),
  ];

  static final restaurantWords = [
    const WordEntity(
      id: 1,
      name: 'Deaf',
      description:
          'Touch the area under the auricle and then the point in the middle of the chin with the index finger of the dominant hand, with the palm edge outwards.',
      videoAssetPath: AppAssets.deaf,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 2,
      name: 'Mother',
      description:
          'the palm of the dominant hand spread out so that the fingers do not touch each other, palm set at an angle to the outside, and then two or three times touch the center of the chin with the thumb',
      videoAssetPath: AppAssets.mother,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 3,
      name: 'Father',
      description:
          'Spread the palm of the dominant hand so that the fingers do not touch, position the palm with the inside of the palm facing out, and then use the thumb to touch the temple on the side of the dominant hand two or three times.',
      videoAssetPath: AppAssets.father,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 4,
      name: 'Tall',
      description:
          'Raise the palm of the non-dominant hand to the height of the chest, then separate it with fingers joined, inside to outside, the palm of the dominant hand set so that the index finger is straight, the thumb is placed on the middle finger, then press the edge of the palm on the index finger side of the dominant hand to the inside of the other hand and make an upward movement along its length.',
      videoAssetPath: AppAssets.tall,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 5,
      name: 'Meet',
      description:
          'Position both palms so that the index fingers remain straight, the rest of the fingers remain clenched, the thumb is placed on the middle finger, and then make a movement so that your palms meet, touching each other with thumbs, remembering to slightly change the angle of the palms (about 20 degrees)',
      videoAssetPath: AppAssets.meet,
      accuracyStatus: WordStatus.notLearnt,
    ),
  ];

  static final businessWords = [
    const WordEntity(
      id: 6,
      name: 'Drink',
      description:
          'Place the palm of your dominant hand backwards forward with the thumb raised (as if you were holding a glass or bottle), then move your hand up as if you wanted to drink, stopping when your thumb touches your lower lip and tilting the imaginary glass.',
      videoAssetPath: AppAssets.drink,
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 7,
      name: 'Walk',
      description:
          'Cinch both palms into a fist, then straighten the index fingers of both hands and position them with the palm corner outward, then lift the palms to shoulder height, changing the direction indicated by the extended fingers by about 90 degrees.',
      videoAssetPath: AppAssets.go,
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 8,
      name: 'Play',
      description:
          'Position both palms so that the thumb and little finger remain straight, then place the palms in this configuration at the level of the bottom of the chest and vigorously move them so that the thumb points alternately forward and backward.',
      videoAssetPath: AppAssets.play,
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 9,
      name: 'Learn',
      description:
          "Set the palm of the non-dominant hand open with fingers joined together, at the level of the bottom of the chest and extend slightly forward, imagine it is a book, pick up the knowledge contained in the book in a smooth movement in which the fingers of the hand join with the thumb, forming a'beak,' then move the hand thus positioned and to the temple on the side of the dominant hand and touch the head with the edge of this hand.",
      videoAssetPath: AppAssets.learn,
      accuracyStatus: WordStatus.decent,
    ),
    const WordEntity(
      id: 10,
      name: 'Travel',
      description:
          "Make a fist with your dominant hand, then straighten your index and middle fingers, bending them at an angle of about 90 degrees. Slightly spread the hand, then place it against the body so that the joint touches slightly above the hip, then make a smooth semicircle movement that should end at the level of the shoulder, and the next movement in which we 'jump' with the hand over our head, a well-executed sign that looks like jumping from place to place.",
      videoAssetPath: AppAssets.travel,
      accuracyStatus: WordStatus.decent,
    ),
  ];

  static final howCanIWords = [
    const WordEntity(
      id: 11,
      name: 'Help',
      description:
          'The sign of help is shown by touching with the open palm of the dominant hand, the edge of the non-dominant hand clenched into a fist and set near the sternum, and the palm of the other hand clenched into a fist and set near the sternum.',
      videoAssetPath: AppAssets.help,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 12,
      name: 'Good',
      description:
          "the dominant hand's palm spread out so that the fingers do not touch, the palm set with the edge outward so that the thumb touches the sternum two or three times.",
      videoAssetPath: AppAssets.good,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 13,
      name: 'Bed',
      description:
          "Place the dominant hand's extended palm against the clavicle on the same side of the body, fingers joining together, then place your cheek on the palm (as if you were putting your face to the pillow).",
      videoAssetPath: AppAssets.bed,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 14,
      name: 'Time',
      description:
          "Clench your dominant hand's palm into a fist, then straighten and bend at an angle of about 90 degrees, index finger, the other hand extend slightly in front of you at the height of the sternum, as if you wanted to check the time, then with the dominant hand's index finger, touch on the non-dominant hand two - three times the place where you usually wear a watch.",
      videoAssetPath: AppAssets.time,
      accuracyStatus: WordStatus.notLearnt,
    ),
    const WordEntity(
      id: 15,
      name: 'How',
      description:
          "Arrange both palms as if you were going to make the 'ok' sign, with the thumb straight. Close the rest of the palm, fingers pointing toward the wrist, then join the palms at the level of the sternum so that they meet with the lower part of the bent fingers, thumbs pointing inward and slightly downward, then outward in a smooth motion.",
      videoAssetPath: AppAssets.how,
      accuracyStatus: WordStatus.notLearnt,
    ),
  ];
}
