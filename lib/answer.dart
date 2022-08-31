import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final void Function() selectedAnswer;

  const Answer({Key? key, required this.title, required this.selectedAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedAnswer,
        child: Text(title),
      ),
    );
  }
}
