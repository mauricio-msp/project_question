import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionnaire.dart';
import 'package:projeto_perguntas/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade600),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const QuestionsPage(title: 'Perguntas'),
    );
  }
}

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.title});

  final String title;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var _selectedQuestion = 0;
  var _sumPointsByQuestions = 0;
  final _questions = const [
    {
      'text': 'Qual sua cor favorita?',
      'alternatives': [
        {'text': 'Blue 💙', 'point': 6},
        {'text': 'Red ❤️', 'point': 8},
        {'text': 'Green 💚', 'point': 10},
        {'text': 'Yellow 💛', 'point': 13},
        {'text': 'Purple 💜', 'point': 9},
        {'text': 'White 🤍', 'point': 22},
      ],
    },
    {
      'text': 'Qual seu animal preferido?',
      'alternatives': [
        {'text': 'Lion 🦁', 'point': 5},
        {'text': 'Frog 🐸', 'point': 1},
        {'text': 'Cat 😺', 'point': 2},
        {'text': 'Bear 🐻', 'point': 7},
        {'text': 'Dog 🐶', 'point': 9}
      ],
    },
  ];

  void _responseQuestion(int points) {
    if (hasQuestions) {
      setState(() {
        _selectedQuestion++;
        _sumPointsByQuestions += points;
      });
    }
  }

  void _resetQuestionnaire() {
    setState(() {
      _selectedQuestion = 0;
      _sumPointsByQuestions = 0;
    });
  }

  bool get hasQuestions {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
        ),
      ),
      body: hasQuestions
          ? Questionnaire(
              questions: _questions,
              selectedQuestion: _selectedQuestion,
              onResponseQuestion: _responseQuestion,
            )
          : Result(
              totalPoints: _sumPointsByQuestions,
              onResetQuestionnaire: _resetQuestionnaire,
            ),
    );
  }
}
