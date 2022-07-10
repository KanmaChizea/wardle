import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/animation/wordle_sign_cubit.dart';
import '../components/hanger.dart';
import '../styles/colors.dart';

class AnimatedWordleSign extends StatefulWidget {
  const AnimatedWordleSign({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedWordleSign> createState() => _AnimatedWordleSignState();
}

class _AnimatedWordleSignState extends State<AnimatedWordleSign>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Tween<double> _tween;
  late AnimationController controller;

  @override
  void initState() {
    _tween = Tween<double>(begin: -0.3, end: 0.3);
    initializeAnimation();

    controller.forward(from: 0);
    super.initState();
  }

  void initializeAnimation() async {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = _tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (context.read<WordleSignCubit>().state > 0) controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          context.read<WordleSignCubit>().update();
          if (context.read<WordleSignCubit>().state > 0) {
            double value = context.read<WordleSignCubit>().state;

            _tween.begin = -value;
            controller.reset();
            _tween.end = value;
            controller.forward();
          } else {
            _tween.begin = 0.03;
            controller.reset();
            _tween.end = 0;
            controller.forward();
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Transform.rotate(
          origin: const Offset(0, -75),
          angle: animation.value,
          child: Column(children: [
            SizedBox(
                width: 228,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Hanger(), Hanger()])),
            Text(
              'WORDLE',
              textAlign: TextAlign.start,
              style: GoogleFonts.gelasio(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                height: 0.8,
                color: white,
              ),
            ),
          ])),
    );
  }
}
