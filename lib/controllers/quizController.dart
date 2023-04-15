import 'package:flutter/material.dart';

import '../models/questionModel.dart';

class QuizController {
  List<Icon> _scoreKeeper = [];
  int _questionIndex = 0;
  bool correctAnswer;
  final List<Question> questions = [
    Question(
        correctAnswer: false,
        questionString: 'You can lead a cow down stairs but not up stairs.'),
    Question(
        correctAnswer: true,
        questionString:
            'Approximately one quarter of human bones are in the feet.'),
    Question(correctAnswer: true, questionString: 'A slug\'s blood is green.'),
    Question(
        questionString: 'Some cats are actually allergic to humans',
        correctAnswer: true),
    Question(
        questionString: 'You can lead a cow down stairs but not up stairs.',
        correctAnswer: false),
    Question(
        questionString:
            'Approximately one quarter of human bones are in the feet.',
        correctAnswer: true),
    Question(questionString: 'A slug\'s blood is green.', correctAnswer: true),
    Question(
        questionString: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        correctAnswer: true),
    Question(
        questionString: 'It is illegal to pee in the Ocean in Portugal.',
        correctAnswer: true),
    Question(
        questionString:
            'No piece of square dry paper can be folded in half more than 7 times.',
        correctAnswer: false),
    Question(
        questionString:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        correctAnswer: true),
    Question(
        questionString:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        correctAnswer: false),
    Question(
        questionString:
            'The total surface area of two human lungs is approximately 70 square metres.',
        correctAnswer: true),
    Question(
        questionString: 'Google was originally called \"Backrub\".',
        correctAnswer: true),
    Question(
        questionString:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        correctAnswer: true),
    Question(
        questionString:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        correctAnswer: true),
  ];

  String getQuestion() {
    return questions[_questionIndex].questionString;
  }

  bool getCorrectAnswer() {
    return questions[_questionIndex].correctAnswer;
  }

  List<Icon> getScoreKeeper() {
    return _scoreKeeper;
  }

  final _correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );

  final _wrongIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );
  
  bool isFinished() {
    return _questionIndex==questions.length;
  }

  void reset() {
    _questionIndex = 0;
    _scoreKeeper = [];
  }
  
  void stateChanges(bool selectedAns) {
    if (_questionIndex < questions.length - 1) {
      correctAnswer = questions[_questionIndex].correctAnswer == selectedAns;
      _scoreKeeper.add(correctAnswer ? _correctIcon : _wrongIcon);
      _questionIndex += 1;
    }
  }
}
