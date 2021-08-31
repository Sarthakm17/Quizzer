import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s the capital of India?',
      'answers': [
        {'text': 'New Delhi', 'score': 10},
        {'text': 'Tokyo', 'score': -1},
        {'text': 'London', 'score': -1},
        {'text': 'Washington, D.C.', 'score': -1},
      ],
    },
    {
      'questionText': 'What\'s the highest mountain?',
      'answers': [
        {'text': 'Kangchenjunga', 'score': -1},
        {'text': 'K2', 'score': -1},
        {'text': 'Mount. Everest', 'score': 10},
        {'text': 'Lhotse', 'score': -1},
      ],
    },
    {
      'questionText': 'What\'s the largest country by total area?',
      'answers': [
        {'text': 'USA', 'score': -1},
        {'text': 'Russia', 'score': 10},
        {'text': 'Canada', 'score': -1},
        {'text': 'China', 'score': -1},
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzer'),
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
