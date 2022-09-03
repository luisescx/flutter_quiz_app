import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Questions extends StatelessWidget {
  final List<String> answers;
  final String question;
  final void Function() selectedAnswer;

  const Questions(
      {Key? key,
      required this.question,
      required this.answers,
      required this.selectedAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Column(
          children: <Widget>[
            Question(title: question),
            ...answers.map((answer) =>
                Answer(title: answer, selectedAnswer: selectedAnswer))
          ],
        )));
  }
}
