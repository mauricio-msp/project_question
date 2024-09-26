import 'package:flutter/material.dart';

class Alternatives extends StatelessWidget {
  final String text;
  final void Function() onSelect;

  const Alternatives({super.key, required this.text, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FilledButton(onPressed: onSelect, child: Text(text)),
    );
  }
}
