import 'package:flutter/material.dart';
import 'package:projeto_perguntas/alternatives.dart';
import 'package:projeto_perguntas/question.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onResponseQuestion;

  const Questionnaire({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.onResponseQuestion,
  });

  bool get hasQuestions {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> alternatives =
        hasQuestions ? questions[selectedQuestion].cast()['alternatives'] : [];

    return Center(
      child: Column(
        children: <Widget>[
          Question(title: questions[selectedQuestion]['text'].toString()),
          ...alternatives.map(
            (alternative) => Alternatives(
              text: alternative['text'] as String,
              onSelect: () => onResponseQuestion(int.parse(
                alternative['point'].toString(),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
