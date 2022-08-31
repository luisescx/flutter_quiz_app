import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String title;

  const Question({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ));
  }
}
