import 'package:flutter/material.dart';
import 'package:woodul/presentation/styles/colors.dart';

import '../animations/wordle_sign.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: bgGradient),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -37,
                          left: MediaQuery.of(context).size.width / 2 - 114,
                          child: const AnimatedWordleSign(),
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
