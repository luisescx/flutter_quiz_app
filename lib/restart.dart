import 'package:flutter/material.dart';

class Restart extends StatelessWidget {
  final void Function() restart;

  const Restart({Key? key, required this.restart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Congratulations', style: TextStyle(fontSize: 24)),
      TextButton(onPressed: restart, child: const Text('Restart'))
    ]));
  }
}

//   Text('Congratulations', style: TextStyle(fontSize: 24))