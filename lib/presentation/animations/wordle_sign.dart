import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/animation/transition_cubit.dart';
import '../../logic/animation/wordle_sign_cubit.dart';
import '../widgets/hanger.dart';
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
    return BlocListener<TransitionCubit, bool>(
      listener: (context, state) {
        if (state == false) controller.forward(from: 0);
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform.rotate(
            origin: const Offset(0, -75),
            angle: controller.isAnimating ? animation.value : 0,
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.only(right: 6, left: 2),
                  width: 240,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Hanger(), Hanger()])),
              Text(
                'WORDLE',
                textAlign: TextAlign.start,
                style: GoogleFonts.gelasio(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  height: 0.9,
                  color: white,
                ),
              ),
            ])),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
