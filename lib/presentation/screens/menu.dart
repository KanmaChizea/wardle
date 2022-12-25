import 'package:flutter/material.dart';
import 'package:woodul/presentation/animations/drop.dart';
import 'package:woodul/presentation/widgets/background.dart';

import '../widgets/options.dart';
import '../widgets/play_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SetBackground(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 42),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SignDrop(),
            PlayButton(),
            MenuOptions(),
          ]),
    ));
  }
}
