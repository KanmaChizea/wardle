import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'wordle_sign.dart';

class SignDrop extends StatefulWidget {
  const SignDrop({Key? key}) : super(key: key);

  @override
  State<SignDrop> createState() => _SignDropState();
}

class _SignDropState extends State<SignDrop>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    initializeAnimation();
    controller.forward();
    super.initState();
  }

  void initializeAnimation() async {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..animateWith(GravitySimulation(10, 0, 100, 0));
    animation = Tween<double>(begin: -150, end: -37).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Stack(
          children: [
            Positioned(
              top: animation.value,
              left: MediaQuery.of(context).size.width / 2 - 136,
              child: const AnimatedWordleSign(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
