import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which player\'s is more heighty?',
      'answers': [
        {'text': 'Messi', 'score': 10},
        {'text': 'Neymar', 'score': 5},
        {'text': 'Cristanio Ronaldo', 'score': 3},
        {'text': 'Zltan Ibhrihomovic', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Which city is the most beautiful?',
      'answers': [
        {'text': 'Darjeeling', 'score': 3},
        {'text': 'Sikim', 'score': 2},
        {'text': 'Manali', 'score': 1},
        {'text': 'Pokhara', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite Place?',
      'answers': [
        {'text': 'Ghorepani Poonhill', 'score': 25},
        {'text': 'Mardi Himal', 'score': 20},
        {'text': 'Annapurna Base Camp', 'score': 15},
        {'text': 'Khapuche Lake', 'score': 23},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
