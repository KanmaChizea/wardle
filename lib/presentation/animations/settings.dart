import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/presentation/extensions/iconbuttons.dart';

import '../../logic/animation/settings_cubit.dart';
import '../components/custom_icon.dart';

class SettingsAnimation extends StatefulWidget {
  const SettingsAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsAnimation> createState() => _SettingsAnimationState();
}

class _SettingsAnimationState extends State<SettingsAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late AnimationController controller1;
  late Animation<double> animation1;
  static const Duration duration = Duration(milliseconds: 300);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: duration);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation1 =
        CurvedAnimation(parent: controller1, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, bool>(
      builder: (context, state) {
        return Column(
          children: [
            if (state)
              ScaleTransition(
                scale: animation1,
                child: const SecondaryIcon(
                  icon: Icons.music_note_outlined,
                ).secondaryButton(),
              ),
            const SizedBox(height: 16),
            if (state)
              ScaleTransition(
                scale: animation1,
                child: const SecondaryIcon(
                  icon: Icons.volume_up_outlined,
                ).secondaryButton(),
              ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
                duration: duration,
                transitionBuilder: (child, _) =>
                    RotationTransition(turns: animation, child: child),
                child: MyIcon(
                  key: ValueKey<bool>(state),
                  icon: state ? Icons.close : Icons.settings_outlined,
                  onPressed: () {
                    if (state) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                    Future.delayed(duration, () {
                      context.read<SettingsCubit>().toggle();
                      if (!state) controller1.forward();
                      if (state) controller1.reverse();
                    });
                  },
                )).primaryButton()
          ],
        );
      },
    );
  }
}
