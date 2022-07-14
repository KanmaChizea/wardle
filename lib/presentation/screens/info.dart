import 'package:flutter/material.dart';
import 'package:woodul/presentation/components/background.dart';
import 'package:woodul/presentation/styles/textstyles.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SetBackground(
        child: Center(
      child: Text(
        'Info Screen',
        style: h1,
      ),
    ));
  }
}
