import 'package:flutter/material.dart';
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
          const MyIcon(icon: Icons.bar_chart_outlined).primaryButton(),
          const MyIcon(icon: Icons.info_outline).primaryButton(),
          const SettingsAnimation()
        ],
      ),
    );
  }
}
