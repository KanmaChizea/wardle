import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/data/dataprocessing_functions.dart';
import 'package:woodul/data/wordlist.dart';
import 'package:woodul/logic/level_cubit.dart';
import 'package:woodul/presentation/extensions/iconbuttons.dart';
import 'package:woodul/presentation/styles/colors.dart';
import 'package:woodul/presentation/widgets/background.dart';
import 'package:woodul/presentation/styles/textstyles.dart';
import 'package:woodul/presentation/widgets/custom_appbar.dart';
import 'package:woodul/presentation/widgets/custom_icon.dart';

import '../../logic/animation/transition_cubit.dart';
import '../../logic/cubit/navigation_cubit.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SetBackground(
        child: SafeArea(
      child: Column(
        children: [
          const MyAppBar(title: 'Levels'),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24),
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  final level = context.watch<LevelCubit>().state;
                  return GestureDetector(
                      onTap: () {
                        if (index + 1 <= level) {
                          context.read<LevelCubit>().gotoLevel(index + 1);
                          resetStage(context);
                          Future.delayed(const Duration(seconds: 1), () {
                            context.read<NavigationCubit>().play();
                          });
                        }
                      },
                      child: index + 1 <= level
                          ? Text(
                              (index + 1).toString(),
                              style: body2,
                            ).primaryButton()
                          : Text(
                              (index + 1).toString(),
                              style: body2.copyWith(color: grey1),
                            ).disabledButton());
                }),
          )
        ],
      ),
    ));
  }
}
