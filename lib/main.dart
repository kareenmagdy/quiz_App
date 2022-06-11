import 'package:flutter/material.dart';
import 'screens/result.dart';
import 'screens/quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s Flutter?',
      'answers': [
        {'text': 'programming language', 'score': 0},
        {'text': 'SDK', 'score': 100},
        {'text': 'Both', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ]
    },
    {
      'questionText': 'What are the advantages of Flutter? ',
      'answers': [
        {'text': 'cross-platform\nDevelopment', 'score': 0},
        {'text': 'Faster Development', 'score': 0},
        {'text': 'UI Focused', 'score': 0},
        {'text': 'All of the above', 'score': 100},
      ]
    },
    {
      'questionText': 'Flutter use one code base',
      'answers': [
        {'text': 'True', 'score': 100},
        {'text': 'False', 'score': 0},

      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
