import 'package:flutter/material.dart';
import 'package:woodul/presentation/components/background.dart';
import 'package:woodul/presentation/styles/textstyles.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SetBackground(
        child: Center(
      child: Text(
        'Levels Screen',
        style: h1,
      ),
    ));
  }
}
