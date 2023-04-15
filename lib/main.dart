import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'controllers/quizController.dart';

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
  QuizController controller = new QuizController();

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
                controller.getQuestion(),
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
                if (controller.isFinished()) {
                  Alert(
                          context: context,
                          title: "GAME OVER",
                          desc: "You have reached the end of this quiz.")
                      .show();
                }
                setState(() {
                  if (controller.isFinished()) {
                    controller.reset();
                  }
                    controller.stateChanges(true);

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
                if (controller.isFinished()) {
                Alert(
                    context: context,
                    title: "GAME OVER",
                    desc: "You have reached the end of this quiz.")
                    .show();
                }
                setState(() {
                  if (controller.isFinished()) {

                    controller.reset();
                  }
                  controller.stateChanges(false);
                });
              },
            ),
          ),
        ),
        // Score Keeper
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.getScoreKeeper(),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
