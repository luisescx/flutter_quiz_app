import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizAppPage(),
    );
  }
}

class QuizAppPage extends StatefulWidget {
  const QuizAppPage({Key? key}) : super(key: key);

  @override
  State<QuizAppPage> createState() => _QuizAppPage();
}

class _QuizAppPage extends State<QuizAppPage> {
  int _activeQuestionIndex = 0;

  List<String> get answers {
    return hasSelectedQuestion
        ? _questions[_activeQuestionIndex]['answers']
        : [];
  }

  bool get hasSelectedQuestion {
    return _activeQuestionIndex < _questions.length;
  }

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which animal do you like the most',
      'answers': ['Dog', 'Cat', 'Bird']
    },
    {
      'question': 'Which color do you like the most',
      'answers': ['Blue', 'Red', 'Black']
    },
    {
      'question': 'Which food do you like the most',
      'answers': ['Pizza', 'Hamburger', 'Pasta']
    },
  ];

  void _selectedAnswer() {
    if (hasSelectedQuestion) {
      setState(() {
        _activeQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Quiz App')),
        body: hasSelectedQuestion
            ? Container(
                padding: const EdgeInsets.all(16),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Question(
                        title: _questions[_activeQuestionIndex]['question']),
                    ...answers.map((answer) =>
                        Answer(title: answer, selectedAnswer: _selectedAnswer))
                  ],
                )))
            : const Center(
                child:
                    Text('Congratulations', style: TextStyle(fontSize: 24))));
  }
}
