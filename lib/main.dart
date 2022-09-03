import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/restart.dart';

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

  void _restartQuiz() {
    setState(() {
      _activeQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Quiz App')),
        body: hasSelectedQuestion
            ? Questions(
                question: _questions[_activeQuestionIndex]['question'],
                answers: answers,
                selectedAnswer: _selectedAnswer)
            : Restart(restart: _restartQuiz));
  }
}
