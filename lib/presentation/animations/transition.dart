import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/animation/transition_cubit.dart';
import '../widgets/painter.dart';

class TransitionAnimation extends StatefulWidget {
  const TransitionAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<TransitionAnimation> createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> down;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.read<TransitionCubit>().toggle();
          Future.delayed(
              const Duration(milliseconds: 900), () => controller.reverse());
        }
      });
    down = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransitionCubit, bool>(
      listener: (context, state) {
        if (state == true) controller.forward();
      },
      child: Stack(
        children: [
          SlideTransition(
              position: down,
              child: CustomPaint(
                painter: MyPainter(down: true),
                child: Container(),
              )),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(math.pi),
            child: SlideTransition(
                position: down,
                child: CustomPaint(
                  painter: MyPainter(down: false),
                  child: Container(),
                )),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
