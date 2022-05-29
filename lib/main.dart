import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
  QuizBrain quizBrain = QuizBrain();
  List<Widget> scoreKeeper = [];

  void iconCheck() {
    scoreKeeper.add(
      Icon(Icons.check, color: Colors.green),
    );
    scoreKeeper.add(
      SizedBox(width: 10),
    );
  }

  void iconClose() {
    scoreKeeper.add(
      Icon(Icons.close, color: Colors.red),
    );
    scoreKeeper.add(
      SizedBox(width: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 10,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                quizBrain.getQuestionText() as String,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Text("True"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.green[500]),
              ),
              onPressed: () {
                setState(() {
                  if (quizBrain.getQuestionAnswer() == true) {
                    iconCheck();
                  } else {
                    iconClose();
                  }
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Text("False"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.red[500]),
              ),
              onPressed: () {
                setState(
                  () {
                    if (quizBrain.getQuestionAnswer() == false) {
                      iconCheck();
                    } else {
                      iconClose();
                    }
                    quizBrain.nextQuestion();
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(children: scoreKeeper),
          ),
        ),
      ],
    );
  }
}
