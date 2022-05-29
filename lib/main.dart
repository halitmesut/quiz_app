import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> scoreKeeper = [];

  void iconCheck() {
    scoreKeeper.add(
      const Icon(Icons.check, color: Colors.green),
    );
    scoreKeeper.add(
      const SizedBox(width: 10),
    );
  }

  void iconClose() {
    scoreKeeper.add(
      const Icon(Icons.close, color: Colors.red),
    );
    scoreKeeper.add(
      const SizedBox(width: 10),
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
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text("True"),
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
              child: const Text("False"),
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
