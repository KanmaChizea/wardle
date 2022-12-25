import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodul/presentation/extensions/iconbuttons.dart';
import 'package:woodul/presentation/styles/textstyles.dart';
import 'package:woodul/presentation/widgets/custom_icon.dart';

import '../../logic/animation/transition_cubit.dart';
import '../../logic/cubit/navigation_cubit.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(children: [
        MyIcon(
            icon: Icons.arrow_back,
            onPressed: () {
              context.read<TransitionCubit>().toggle();
              Future.delayed(const Duration(seconds: 1),
                  () => context.read<NavigationCubit>().menu());
            }).primaryButton(),
        Flexible(
            child: Center(
                child: Text('$title      ',
                    style: GoogleFonts.gorditas(textStyle: h2)))),
      ]),
    );
  }
}
