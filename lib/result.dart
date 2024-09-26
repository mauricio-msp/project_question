import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalPoints;
  final void Function() onResetQuestionnaire;

  const Result({
    super.key,
    required this.totalPoints,
    required this.onResetQuestionnaire,
  });

  String get messageResult {
    print(totalPoints);

    if (totalPoints < 8) return 'Parabéns';
    if (totalPoints < 12) return 'Você é bom';
    if (totalPoints < 16) return 'Impressionante!';

    return 'Nível Jedi!!!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            messageResult,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: onResetQuestionnaire,
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
