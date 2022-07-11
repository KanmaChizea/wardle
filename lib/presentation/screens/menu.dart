import 'package:flutter/material.dart';

import 'package:woodul/presentation/animations/drop.dart';
import 'package:woodul/presentation/styles/colors.dart';

import '../components/options.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: bgGradient),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 42),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SignDrop(),
                    MenuOptions(),
                  ]),
            )));
  }
}
