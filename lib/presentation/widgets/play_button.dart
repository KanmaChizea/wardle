import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodul/data/dataprocessing_functions.dart';

import '../../logic/animation/transition_cubit.dart';
import '../../logic/cubit/navigation_cubit.dart';
import '../styles/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<TransitionCubit>().toggle();
          resetStage(context);
          Future.delayed(const Duration(seconds: 1),
              () => context.read<NavigationCubit>().play());
        },
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: white,
                  width: 2,
                ))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow_outlined, size: 30, color: white),
            const SizedBox(width: 4),
            Text(
              'PLAY',
              style: GoogleFonts.gorditas(
                fontSize: 30,
                color: white,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ));
  }
}
