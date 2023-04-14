import 'package:flutter/material.dart';

import './models/questionModel.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> _scoreKeeper = [];
  final _correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );
  final _wrongIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );
  final List<Question> _questions = [
    Question(
      index: 1,
      correctAnswer: false,
      questionString: 'You can lead a cow down stairs but not up stairs.',
    ),
    Question(
      index: 2,
      correctAnswer: true,
      questionString:
          'Approximately one quarter of human bones are in the feet.',
    ),
    Question(
      index: 3,
      correctAnswer: true,
      questionString: 'A slug\'s blood is green.',
    ),
  ];
  int questionIndex = 0;
  late bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Question
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _questions[questionIndex].questionString,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // True option
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  correctAnswer = _questions[questionIndex].correctAnswer ? true : false;
                  addIcon();
                  questionIndex += 1;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        // False option
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                correctAnswer = !_questions[questionIndex].correctAnswer ? true : false;
                addIcon();
                questionIndex += 1;
              },
            ),
          ),
        ),
        // Score Keeper
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _scoreKeeper,
        )
      ],
    );
  }

  void addIcon() {
    _scoreKeeper.add(correctAnswer ? _correctIcon : _wrongIcon);
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
