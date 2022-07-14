import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/animation/transition_cubit.dart';
import 'package:woodul/logic/cubit/navigation_cubit.dart';
import 'package:woodul/presentation/extensions/iconbuttons.dart';

import '../animations/settings.dart';
import 'custom_icon.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MyIcon(
            icon: Icons.bar_chart_outlined,
            onPressed: () {
              context.read<TransitionCubit>().toggle();
              Future.delayed(const Duration(seconds: 1),
                  () => context.read<NavigationCubit>().level());
            },
          ).primaryButton(),
          MyIcon(
            icon: Icons.info_outline,
            onPressed: () {
              context.read<TransitionCubit>().toggle();
              Future.delayed(const Duration(seconds: 1),
                  () => context.read<NavigationCubit>().info());
            },
          ).primaryButton(),
          const SettingsAnimation()
        ],
      ),
    );
  }
}
