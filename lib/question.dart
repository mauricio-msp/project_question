import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String title;

  const Question({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
