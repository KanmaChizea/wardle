import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cubit/navigation_cubit.dart';

import '../../logic/animation/transition_cubit.dart';
import '../styles/colors.dart';

class SetBackground extends StatelessWidget {
  final Widget child;
  const SetBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(gradient: bgGradient),
        child: WillPopScope(
            onWillPop: () async {
              if ((context.read<TransitionCubit>().state
                  is! NavigationInitial)) {
                context.read<TransitionCubit>().toggle();
                Future.delayed(const Duration(seconds: 1), () {
                  context.read<NavigationCubit>().goback();
                });
              }

              return false;
            },
            child: Scaffold(backgroundColor: Colors.transparent, body: child)));
  }
}
