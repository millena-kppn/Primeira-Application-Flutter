import 'package:flutter/material.dart';

class SubtituloWidget extends StatelessWidget {
  const SubtituloWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
    "Aprendendo Flutter",
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Colors.white
      ),
      );   
  }
}