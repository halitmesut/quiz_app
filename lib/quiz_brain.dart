import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Questions> _questionBank = [
    Questions(a: "Question One", b: false),
    Questions(a: "Question Two", b: true),
    Questions(a: "Question Three", b: false),
    Questions(a: "Question Four", b: true),
    Questions(a: "Question Five", b: false)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText as String;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer as bool;
  }
}
