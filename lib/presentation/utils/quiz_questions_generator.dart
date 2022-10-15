import 'package:gts_learn/presentation/feature/quiz/model/quiz_answer.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';

class QuizQuestionsGenerator {
  QuizQuestionsGenerator._();

  static const _placeholderDesc = 'Choose word which fits video above.';

  static const List<QuizAnswer> _placeholderData = [
    QuizAnswer(label: 'Dinner'),
    QuizAnswer(label: 'Lunch'),
    QuizAnswer(label: 'Breakfast'),
    QuizAnswer(label: 'Waiter'),
    QuizAnswer(label: 'Bill'),
    QuizAnswer(label: 'Table'),
    QuizAnswer(label: 'Tip'),
    QuizAnswer(label: 'Money'),
  ];

  static List<QuizQuestion> generateQuestions({
    List<QuizAnswer> answers = _placeholderData,
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
        ),
      );
    }
    return questions;
  }
}
