import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cubit/navigation_cubit.dart';
import 'package:woodul/presentation/animations/transition.dart';
import 'package:woodul/presentation/screens/game.dart';
import 'package:woodul/presentation/screens/info.dart';
import 'package:woodul/presentation/screens/levels.dart';
import 'package:woodul/presentation/screens/menu.dart';

class NavHandler extends StatelessWidget {
  const NavHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state is NavigationInitial) const MenuScreen(),
            if (state is NavigationLevel) const LevelsScreen(),
            if (state is NavigationInfo) const InfoScreen(),
            if (state is NavigationGame) const GameScreen(),
            const TransitionAnimation()
          ],
        );
      },
    );
  }
}
