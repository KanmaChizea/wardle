import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:woodul/data/dataprocessing_functions.dart';
import 'package:woodul/logic/cell/form_cubit.dart';
import 'package:woodul/logic/level_cubit.dart';
import 'package:woodul/presentation/styles/textstyles.dart';
import 'package:woodul/presentation/widgets/ratings.dart';

import '../styles/colors.dart';
import 'guess_distribution.dart';

class GameOver extends StatelessWidget {
  final BuildContext dialogContext;
  final String title;
  const GameOver({
    Key? key,
    required this.dialogContext,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF16111A),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text(title),
              titleTextStyle: h1,
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share))
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            const StarRating(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '    GUESS DISTRIBUTION',
                  style: body1,
                ),
                Text(
                  '${context.read<LevelCubit>().state}   ${context.read<FormCubit>().state}/6',
                  style: body1,
                )
              ],
            ),
            const SizedBox(height: 16),
            const GuessDistribution(),
            const SizedBox(height: 16),
            title == 'Level Failed'
                ? Center(
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          context
                              .read<LevelCubit>()
                              .gotoLevel(context.read<LevelCubit>().state);
                          resetStage(context);
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: white,
                                  width: 2,
                                ))),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Play again')),
                  )
                : Center(
                    child: TextButton.icon(
                        icon: const Icon(Icons.arrow_forward),
                        style: TextButton.styleFrom(
                            foregroundColor: white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: white,
                                  width: 2,
                                ))),
                        label: const Text('Next level'),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          context.read<LevelCubit>().nextLevel();
                          resetStage(context);
                        }),
                  )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
