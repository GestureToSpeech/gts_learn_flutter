import 'package:gts_learn/domain/model/word_entity.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';

class QuizQuestionsGenerator {
  QuizQuestionsGenerator._();

  static const _placeholderDesc = 'Choose word which fits video above.';

  static List<QuizQuestion> generateQuestions({
    required List<WordEntity> answers,
    int optionsToChoose = 5,
  }) {
    final questions = <QuizQuestion>[];
    for (final entry in answers) {
      final otherAnswers = answers.where((value) => value != entry).toList()
        ..shuffle();
      questions.add(
        QuizQuestion(
          correctAnswers: [entry],
          answers: [entry, ...otherAnswers.sublist(0, optionsToChoose - 1)]
            ..shuffle(),
          description: _placeholderDesc,
          videoAssetPath: entry.videoAssetPath,
        ),
      );
    }
    return questions..shuffle();
  }
}
